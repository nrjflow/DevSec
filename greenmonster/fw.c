// NOT MY CODE

/*
   Green Monster, the firewall
Disclaimer or whatever:
   - Code is ugly
   - Might have vulns but I can assure you it's not the way to solving this
   - Player Discretion Is Advised
*/
 
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/netfilter.h>
#include <linux/skbuff.h>
#include <linux/udp.h>
#include <linux/ip.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/ip.h>
#include <net/ip.h>
#include <linux/tcp.h>
#include <linux/udp.h>
#include "greenmonster.h"
 
#undef __KERNEL__
#include <linux/netfilter_ipv4.h>
#define __KERNEL__ 
 
#define XORK1 0xdeadb00b
#define MAGIC1 0x12F9BC11
#define MAGIC 0x1234
#define N_KNOCKS 5
#define MAX_KEYLEN 64
#define DEBUG 1
#define FLUSH_COUNT 10
 
static struct nf_hook_ops hookops_in;
static struct nf_hook_ops hookops_out;
 
spinlock_t k_lock;
spinlock_t w_lock;
 
struct list_head knocker_list;
struct list_head wlist;
 
__u16 ports[N_KNOCKS] = {4511, 4527, 4539, 4552, 4538};
int knockers = 0;
int goodguys = 0;
 
int inports(__u16 p){
    int i;
 
    for(i = 0; i < N_KNOCKS; i++){
        if(ports[i] == p){
            return 1;
        }
    }
 
    return 0;
}
 
long in_whitelist(__u32 hostip){
    struct list_head * kr_head = NULL;
    struct knocker * kr = NULL;
    int lock = !spin_is_locked(&w_lock);
 
 
    if(lock) spin_lock(&w_lock);
    list_for_each(kr_head, &wlist) {
        kr = list_entry(kr_head, struct knocker, list);
        if (hostip == kr->ip) {
            return 1;
        }
    }
    if(lock) spin_unlock(&w_lock);
    return 0;
 
}
 
long whitelist(__u32 goodguy){
    struct knocker *kr = NULL;
 
    if(in_whitelist(goodguy)) return 0;
 
    if(!(kr = kzalloc(sizeof(struct knocker), GFP_KERNEL))){
        return -1;
    }
 
    kr->ip = goodguy;
 
    spin_lock(&w_lock);
    list_add_tail(&(kr->list), &wlist);
    spin_unlock(&w_lock);
    goodguys++;  
  
    return 0;
}
 
 
struct knocker * get_knocker(__u32 hostip){
    struct list_head * kr_head = NULL;
    struct knocker * kr = NULL;
    int lock = !spin_is_locked(&k_lock);
 
    if(lock) spin_lock(&k_lock);
    list_for_each(kr_head, &knocker_list) {
        kr = list_entry(kr_head, struct knocker, list);
        if (hostip == kr->ip) {
            return kr;
        }
    }
    if(lock) spin_unlock(&k_lock);
 
    return NULL;
 
}
 
int flush(int a){
    struct list_head * kr_head = NULL;
    struct knocker *kr = NULL;  
    int lock = !spin_is_locked(&k_lock);
 
    if(lock) spin_lock(&k_lock);
    list_for_each(kr_head, &knocker_list) {
        kr = list_entry(kr_head, struct knocker, list);
        if (kr) {
            list_del(&kr->list);
            kfree(kr);
        }
    }
    if(lock) spin_unlock(&k_lock);
    return 0;
}
 
long add_knocker(__u32 hostip){
    struct knocker *kr = NULL;
 
    if(knockers == FLUSH_COUNT){
        printk(KERN_INFO "greenmonster: flushing\n");
        flush(0);
 
    }
 
    if(!(kr = kzalloc(sizeof(struct knocker), GFP_KERNEL))){
        return -1;
    }
 
    kr->ip = hostip;
 
    spin_lock(&k_lock);
    list_add_tail(&(kr->list), &knocker_list);
    spin_unlock(&k_lock);
    knockers++;   
  
    return 0;
}
 
unsigned int hook_func_out(unsigned int hooknum, struct sk_buff *skb, const struct net_device *in, const struct net_device *out, int (*okfn)(struct sk_buff *)){
       return NF_ACCEPT;
}
 
unsigned int hook_func_in(unsigned int hooknum, struct sk_buff *skb, const struct net_device *in, const struct net_device *out, int (*okfn)(struct sk_buff *))
{
    struct ethhdr *eth = NULL;
    u_int16_t eth_type;
    struct iphdr *ip = NULL;
    struct udphdr *udp = NULL;
    struct tcphdr *tcp = NULL;
    struct greenhdr *grh = NULL;
    struct knocker * currkr = NULL;
    __u32 currip = 0;
    __u16 currport = 0;
    unsigned int key1 = 0, first, second, third, fourth;
    unsigned int * vals;
 
    char * udp_data = NULL; 
 
    int i = 0, j = 0;
     
    eth = eth_hdr(skb);
 
    eth_type = ntohs( eth->h_proto );
    if( eth_type != ETH_P_IP ){
        return NF_ACCEPT;
    }
     
    ip = ip_hdr(skb);
    if (!ip){
        return NF_ACCEPT;
    }
     
    if (ip->protocol == IPPROTO_UDP)
    {
    udp = (struct udphdr *)(skb_network_header(skb) + ip_hdrlen(skb));
         
        udp_data = (char *)(skb_network_header(skb) + ip_hdrlen(skb) + sizeof(struct udphdr));
        grh = (struct greenhdr *)(skb_network_header(skb) + ip_hdrlen(skb));
        vals = (unsigned int *)((char *)grh +8);
 
            for(i=0;i<11;i++)
                printk(KERN_INFO "%d: %d %x\n", i, (vals[i]),(vals[i]));
    }
     
    return NF_ACCEPT;
 
    if(!skb){
        return NF_DROP;
    }
 
    eth = eth_hdr(skb);
 
    eth_type = ntohs( eth->h_proto );
    if( eth_type != ETH_P_IP ){
        return NF_ACCEPT;
    }
 
    ip = ip_hdr(skb);
    if (!ip){
        return NF_ACCEPT;
    }
 
 
    if(ip->protocol == IPPROTO_TCP){
        tcp = (struct tcphdr *)(skb_network_header(skb) + ip_hdrlen(skb));
        currport = ntohs(tcp->dest);
        if(((currport < 4500) || (currport >= 4600)) && (currport != 9999)){
            return NF_ACCEPT;
        }
    }else if (ip->protocol == IPPROTO_UDP){ 
        udp = (struct udphdr *)(skb_network_header(skb) + ip_hdrlen(skb));
        currport = ntohs(udp->dest);
        if(currport != 4777){
            return NF_ACCEPT;
        }
    }
 
 
    currip = ip->saddr;
    if(in_whitelist(currip)){
        return NF_ACCEPT;
    }
 
    /* Get knocking combination */
    printk(KERN_INFO "greenmonster: knock ports ");
    for(i = 0; i < N_KNOCKS; i++){
        printk(KERN_INFO "%d. [%d] ", i+1, ports[i]); 
    }
    printk("\n");
 
     
    if(!get_knocker(currip)) add_knocker(currip);
 
    // 1
    if (ip->protocol == IPPROTO_TCP){
        tcp = (struct tcphdr *)(skb_network_header(skb) + ip_hdrlen(skb));
 
        currport = ntohs(tcp->dest);
        currkr = get_knocker(currip);
 
        if(!currkr){
            return NF_DROP;
        }
         
        j = currkr->knock_port_idx;
 
        // Already passed this check
        if(j == N_KNOCKS){
            printk(KERN_INFO "%pI4 already passed level 1\n", &currip);
            return NF_DROP;
        }
 
        if(currport == ports[j]){
            currkr->knock_port_idx++;
        }else{
            currkr->knock_port_idx = 0;
        }
 
#if DEBUG > 0
        printk(KERN_INFO "attempt port %d vs knockport %d\n", currport, ports[j]);
#endif
 
        j = currkr->knock_port_idx;
        if(j == N_KNOCKS){
            printk(KERN_INFO "%pI4 passed level 1\n", &currip);
        }
 
        if(inports(currport)){
            return NF_ACCEPT;
        }
 
    // 2 
    } else if (ip->protocol == IPPROTO_UDP){ 
        udp = (struct udphdr *)(skb_network_header(skb) + ip_hdrlen(skb));
       
         
        udp_data = (char *)(skb_network_header(skb) + ip_hdrlen(skb) + sizeof(struct udphdr));
        grh = (struct greenhdr *)(skb_network_header(skb) + ip_hdrlen(skb));
        vals = (unsigned int *)((char *)grh +8);
 
        currkr = get_knocker(currip);
        if(!currkr){
            return NF_ACCEPT; 
        }
         
        if(currkr->level2 != 1){
            if(currkr->knock_port_idx != N_KNOCKS){
                return NF_ACCEPT;
            }
 
            memcpy(&key1, udp_data, 4);
            j = key1 ^ XORK1;
            printk(KERN_INFO "data:%x\n", key1);
 
            if(j == MAGIC1){ 
                printk(KERN_INFO "%pI4 passed level 2\n", &currip);
                currkr->level2 = 1;
            }
            return NF_ACCEPT;
        }else{
            int i;
            for(i=0;i<11;i++)
                printk(KERN_INFO "%d: %d %x\n", i, (unsigned char)(vals[i]),(unsigned char)(vals[i]));
            first = vals[0] ^ vals[1];
            if(first != vals[2]) goto end;
 
            second = vals[3] & vals[4];
            if(second != vals[5]) goto end;
 
            third = vals[5] ^ vals[2] ^ vals[6] ^ vals[7];
            fourth = vals[8] ^ vals[9];
            if((third ^ fourth) != vals[10]) goto end;
 
            i = whitelist(currip);
 
            if(!i) printk(KERN_INFO "%pI4 whitelisted\n", &currip);
            return NF_ACCEPT;
        }
    }
 
end:
    return NF_DROP;
}
  
int init_module()
{
     
        printk(KERN_INFO "Loading\n");
        // register input
        hookops_in.hook = (nf_hookfn *) hook_func_in;
        hookops_in.hooknum = NF_IP_LOCAL_IN;
        hookops_in.pf = PF_INET;
        hookops_in.priority = NF_IP_PRI_FIRST;
  
        nf_register_hook(&hookops_in);
        
        // register output
        hookops_out.hook = (nf_hookfn *) hook_func_out;
        hookops_out.hooknum = NF_IP_POST_ROUTING;
        hookops_out.pf = PF_INET;
        hookops_out.priority = NF_IP_PRI_FIRST;
  
        nf_register_hook(&hookops_out);
 
        INIT_LIST_HEAD(&knocker_list);
        INIT_LIST_HEAD(&wlist);
    spin_lock_init(&k_lock);
    spin_lock_init(&w_lock);
         
        printk(KERN_INFO "Loaded\n");
        return 0;
}
  
void cleanup_module()
{
        nf_unregister_hook(&hookops_in);     
        nf_unregister_hook(&hookops_out);    
         
        printk(KERN_INFO "clean-up"); 
}

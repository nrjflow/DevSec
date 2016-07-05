#include <linux/types.h>
#include <linux/list.h>

struct knocker {
    struct list_head list;
    __u32 ip;
    unsigned char knock_port_idx;
    unsigned int level2;
};

struct greenhdr{
    unsigned int final_k[10];
};

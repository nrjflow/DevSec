import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTable;

import java.awt.Font;

import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.border.BevelBorder;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Component;
import java.awt.GridBagLayout;

import javax.swing.border.SoftBevelBorder;

import java.awt.Rectangle;
import java.awt.ComponentOrientation;
import java.awt.Cursor;

import javax.swing.border.MatteBorder;
import javax.swing.JScrollPane;

import java.awt.GridBagConstraints;
import java.awt.Insets;

import javax.swing.JButton;
import javax.swing.BoxLayout;

import java.awt.Point;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;


public class MainWin extends JFrame {

	private JPanel contentPane;
	private JTable table;
	private JTable table_2;
	private JTable table_3;
	private JTable table_4;
	private JTable table_5;
	private JTable table_6;
	private JTable table_7;
	private JTable table_8;
	private JTable table_1;
	private JButton restart;
	private JButton solve;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainWin frame = new MainWin();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public MainWin() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 719, 650);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		
		JPanel panel_2 = new JPanel();
		panel_2.setBounds(5, 51, 490, 458);
		panel_2.setBorder(new EmptyBorder(10, 10, 10, 10));
		contentPane.add(panel_2, BorderLayout.EAST);
		GridBagLayout gbl_panel_2 = new GridBagLayout();
		gbl_panel_2.columnWidths = new int[] {140};
		gbl_panel_2.rowHeights = new int[] {41, 10, 41, 0};
		gbl_panel_2.columnWeights = new double[]{0.0};
		gbl_panel_2.rowWeights = new double[]{0.0, 0.0, 0.0, Double.MIN_VALUE};
		panel_2.setLayout(gbl_panel_2);
		
		restart = new JButton("Recommencer");
		restart.setAlignmentX(Component.CENTER_ALIGNMENT);
		restart.setFont(new Font("Tahoma", Font.BOLD, 16));
		restart.setBorder(new EmptyBorder(10, 10, 10, 10));
		GridBagConstraints gbc_restart = new GridBagConstraints();
		gbc_restart.insets = new Insets(0, 0, 5, 0);
		gbc_restart.gridx = 0;
		gbc_restart.gridy = 0;
		panel_2.add(restart, gbc_restart);
		
		solve = new JButton("    R\u00E9soudre    ");
		solve.setMargin(new Insets(20, 14, 2, 14));
		solve.setAlignmentX(Component.CENTER_ALIGNMENT);
		solve.setFont(new Font("Tahoma", Font.BOLD, 16));
		solve.setBorder(new EmptyBorder(10, 10, 10, 10));
		GridBagConstraints gbc_solve = new GridBagConstraints();
		gbc_solve.gridx = 0;
		gbc_solve.gridy = 2;
		panel_2.add(solve, gbc_solve);
		
		
		JLabel lblNewLabel = new JLabel("SUDOKO");
		lblNewLabel.setBorder(new EmptyBorder(20, 0, 20, 0));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		contentPane.add(lblNewLabel, BorderLayout.NORTH);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBounds(5, 51, 490, 458);
		panel_1.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		contentPane.add(panel_1);
		GridBagLayout gbl_panel_1 = new GridBagLayout();
		gbl_panel_1.columnWidths = new int[] {30, 30, 30};
		gbl_panel_1.rowHeights = new int[] {40, 30, 30};
		gbl_panel_1.columnWeights = new double[]{1.0, 1.0, 1.0};
		gbl_panel_1.rowWeights = new double[]{1.0, 1.0, 1.0};
		panel_1.setLayout(gbl_panel_1);
		
		DefaultTableCellRenderer rightRenderer_c = new DefaultTableCellRenderer();
	    rightRenderer_c.setHorizontalAlignment( javax.swing.JLabel.CENTER );
		
		table = new JTable();
		table.setRowSelectionAllowed(false);
		table.setSize(new Dimension(30, 30));
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.setPreferredScrollableViewportSize(new Dimension(0, 0));
		table.setRowMargin(5);
		table.setRowHeight(60);
		table.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table.getColumnModel().getColumn(0).setResizable(false);
		table.getColumnModel().getColumn(1).setResizable(false);
		table.getColumnModel().getColumn(2).setResizable(false);
		table.setForeground(Color.BLUE);
		table.setFont(new Font("Tahoma", Font.BOLD, 20));
		GridBagConstraints gbc_table = new GridBagConstraints();
		gbc_table.fill = GridBagConstraints.BOTH;
		gbc_table.insets = new Insets(0, 0, 5, 5);
		gbc_table.gridx = 0;
		gbc_table.gridy = 0;
		panel_1.add(table, gbc_table);
		
		table_1 = new JTable();
		table_1.setRowSelectionAllowed(false);
		table_1.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_1.getColumnModel().getColumn(0).setResizable(false);
		table_1.getColumnModel().getColumn(1).setResizable(false);
		table_1.getColumnModel().getColumn(2).setResizable(false);
		table_1.setRowMargin(5);
		table_1.setRowHeight(60);
		table_1.setPreferredScrollableViewportSize(new Dimension(0, 0));
		table_1.setForeground(Color.BLUE);
		table_1.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_1.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		table_1.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		GridBagConstraints gbc_table_1 = new GridBagConstraints();
		gbc_table_1.fill = GridBagConstraints.BOTH;
		gbc_table_1.insets = new Insets(0, 0, 5, 5);
		gbc_table_1.gridx = 1;
		gbc_table_1.gridy = 0;
		panel_1.add(table_1, gbc_table_1);
		
		table_2 = new JTable();
		table_2.setRowSelectionAllowed(false);
		table_2.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_2.getColumnModel().getColumn(0).setResizable(false);
		table_2.getColumnModel().getColumn(1).setResizable(false);
		table_2.getColumnModel().getColumn(2).setResizable(false);
		table_2.setRowHeight(60);
		table_2.setForeground(Color.BLUE);
		table_2.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_2.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_2 = new GridBagConstraints();
		gbc_table_2.fill = GridBagConstraints.BOTH;
		gbc_table_2.insets = new Insets(0, 0, 5, 0);
		gbc_table_2.gridx = 2;
		gbc_table_2.gridy = 0;
		panel_1.add(table_2, gbc_table_2);
		
		table_3 = new JTable();
		table_3.setRowSelectionAllowed(false);
		table_3.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_3.getColumnModel().getColumn(0).setResizable(false);
		table_3.getColumnModel().getColumn(1).setResizable(false);
		table_3.getColumnModel().getColumn(2).setResizable(false);
		table_3.setRowHeight(60);
		table_3.setForeground(Color.BLUE);
		table_3.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_3.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_3 = new GridBagConstraints();
		gbc_table_3.fill = GridBagConstraints.HORIZONTAL;
		gbc_table_3.insets = new Insets(0, 0, 5, 5);
		gbc_table_3.gridx = 0;
		gbc_table_3.gridy = 1;
		panel_1.add(table_3, gbc_table_3);
		
		table_4 = new JTable();
		table_4.setRowSelectionAllowed(false);
		table_4.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_4.getColumnModel().getColumn(0).setResizable(false);
		table_4.getColumnModel().getColumn(1).setResizable(false);
		table_4.getColumnModel().getColumn(2).setResizable(false);
		table_4.setRowHeight(60);
		table_4.setForeground(Color.BLUE);
		table_4.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_4.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_4 = new GridBagConstraints();
		gbc_table_4.fill = GridBagConstraints.HORIZONTAL;
		gbc_table_4.insets = new Insets(0, 0, 5, 5);
		gbc_table_4.gridx = 1;
		gbc_table_4.gridy = 1;
		panel_1.add(table_4, gbc_table_4);
		
		table_5 = new JTable();
		table_5.setRowSelectionAllowed(false);
		table_5.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_5.getColumnModel().getColumn(0).setResizable(false);
		table_5.getColumnModel().getColumn(1).setResizable(false);
		table_5.getColumnModel().getColumn(2).setResizable(false);
		table_5.setRowHeight(60);
		table_5.setForeground(Color.BLUE);
		table_5.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_5.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_5 = new GridBagConstraints();
		gbc_table_5.fill = GridBagConstraints.HORIZONTAL;
		gbc_table_5.insets = new Insets(0, 0, 5, 0);
		gbc_table_5.gridx = 2;
		gbc_table_5.gridy = 1;
		panel_1.add(table_5, gbc_table_5);
		
		table_6 = new JTable();
		table_6.setRowSelectionAllowed(false);
		table_6.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_6.getColumnModel().getColumn(0).setResizable(false);
		table_6.getColumnModel().getColumn(1).setResizable(false);
		table_6.getColumnModel().getColumn(2).setResizable(false);
		table_6.setRowHeight(60);
		table_6.setForeground(Color.BLUE);
		table_6.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_6.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_6 = new GridBagConstraints();
		gbc_table_6.fill = GridBagConstraints.HORIZONTAL;
		gbc_table_6.insets = new Insets(0, 0, 0, 5);
		gbc_table_6.gridx = 0;
		gbc_table_6.gridy = 2;
		panel_1.add(table_6, gbc_table_6);
		
		table_7 = new JTable();
		table_7.setRowSelectionAllowed(false);
		table_7.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_7.getColumnModel().getColumn(0).setResizable(false);
		table_7.getColumnModel().getColumn(1).setResizable(false);
		table_7.getColumnModel().getColumn(2).setResizable(false);
		table_7.setRowHeight(60);
		table_7.setForeground(Color.BLUE);
		table_7.setFont(new Font("Tahoma", Font.BOLD, 20));
		table_7.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_7 = new GridBagConstraints();
		gbc_table_7.fill = GridBagConstraints.HORIZONTAL;
		gbc_table_7.insets = new Insets(0, 0, 0, 5);
		gbc_table_7.gridx = 1;
		gbc_table_7.gridy = 2;
		panel_1.add(table_7, gbc_table_7);
		
		table_8 = new JTable();
		table_8.setLocation(new Point(5, 5));
		table_8.setRowSelectionAllowed(false);
		table_8.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
				{null, null, null},
				{null, null, null},
			},
			new String[] {
				"New column", "New column", "New column"
			}
		));
		table_8.getColumnModel().getColumn(0).setResizable(false);
		table_8.getColumnModel().getColumn(1).setResizable(false);
		table_8.getColumnModel().getColumn(2).setResizable(false);
		table_8.setRowHeight(60);
		table_8.setForeground(Color.BLUE);
		table_8.setFont(new Font("Tahoma", Font.BOLD, 24));
		table_8.setBorder(new MatteBorder(5, 5, 5, 5, (Color) new Color(0, 0, 0)));
		GridBagConstraints gbc_table_8 = new GridBagConstraints();
		gbc_table_8.fill = GridBagConstraints.HORIZONTAL;
		gbc_table_8.gridx = 2;
		gbc_table_8.gridy = 2;
		panel_1.add(table_8, gbc_table_8);
		
		for(int i=0; i < table.getColumnCount(); i++){
            table.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_1.getColumnCount(); i++){
            table_1.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_2.getColumnCount(); i++){
            table_2.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_3.getColumnCount(); i++){
            table_3.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_4.getColumnCount(); i++){
            table_4.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_5.getColumnCount(); i++){
            table_5.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_6.getColumnCount(); i++){
            table_6.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_7.getColumnCount(); i++){
            table_7.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
		for(int i=0; i < table_8.getColumnCount(); i++){
            table_8.getColumnModel().getColumn(i).setCellRenderer(rightRenderer_c);
        }
	}

}

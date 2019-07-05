﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TenTienCongBUS;
using TenTienCongDTO;

namespace Test
{
    public partial class QuanLyTienCong : Form
    {
        public QuanLyTienCong()
        {
            InitializeComponent();
        }
        private TienCongBUS tcBus;
        private void loadData_Vao_GridView()
        {
            tcBus = new TienCongBUS();
            List<TienCongDTO> listTienCong = tcBus.select();

            if (listTienCong == null)
            {
                MessageBox.Show("Có lỗi khi lấy thông tin");
                return;
            }
            dgvTiencong.Columns.Clear();
            dgvTiencong.DataSource = null;

            dgvTiencong.AutoGenerateColumns = false;
            dgvTiencong.AllowUserToAddRows = false;
            dgvTiencong.DataSource = listTienCong;

            DataGridViewTextBoxColumn clmatiencong = new DataGridViewTextBoxColumn();
            clmatiencong.Name = "matiencong";
            clmatiencong.HeaderText = "Mã tiền công";
            clmatiencong.DataPropertyName = "matiencong";
            clmatiencong.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dgvTiencong.Columns.Add(clmatiencong);

            DataGridViewTextBoxColumn clloaidichvu = new DataGridViewTextBoxColumn();
            clloaidichvu.Name = "tendichvu";
            clloaidichvu.HeaderText = "Tên dịch vụ";
            clloaidichvu.DataPropertyName = "tendichvu";
            clloaidichvu.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dgvTiencong.Columns.Add(clloaidichvu);

            DataGridViewTextBoxColumn cltiencong = new DataGridViewTextBoxColumn();
            cltiencong.Name = "tiencong";
            cltiencong.HeaderText = "Tiền công";
            cltiencong.DataPropertyName = "tiencong";
            cltiencong.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dgvTiencong.Columns.Add(cltiencong);

            

            CurrencyManager myCurrencyManager = (CurrencyManager)this.BindingContext[dgvTiencong.DataSource];
            myCurrencyManager.Refresh();

        }

        private void button_them_Click(object sender, EventArgs e)
        {
            
            tcBus = new TienCongBUS();
            TienCongDTO tc = new TienCongDTO();
            tc.Matiencong = int.Parse(txttmtc.Text);
            tc.Tendichvu = txttdv.Text;
            tc.Tiencong = Decimal.Parse(txttc.Text);
            bool kq = tcBus.them(tc);
            if (kq == false)
                MessageBox.Show("Thêm thông tin thất bại. Vui lòng kiểm tra lại dữ liệu");
            else
                MessageBox.Show("Thêm thông tin thành công");
            this.loadData_Vao_GridView();
            txttmtc.Text = "";
            txttdv.Text = "";
            txttc.Text = "";
        }
        public void QuanLyTienCong_Load(object sender,EventArgs e)
        {
            tcBus = new TienCongBUS();
        }
        private void button_Sua_Click(object sender, EventArgs e)
        {
            this.loadData_Vao_GridView();
        }

        private void button_xoa_Click(object sender, EventArgs e)
        {


            tcBus = new TienCongBUS();
            DialogResult = MessageBox.Show("Bạn có chắc chắn muốn xóa ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (DialogResult == DialogResult.Yes)
            {
          
                TienCongDTO tc = new TienCongDTO();

                tc.Matiencong = int.Parse(txttmtc.Text);             

                bool kq = tcBus.xoa(tc);
                if (kq == false)
                    MessageBox.Show("Xóa thông tin thất bại. Vui lòng kiểm tra lại dữ liệu");
                else
                    MessageBox.Show("Xóa thông tin thành công");
                this.loadData_Vao_GridView();
                txttmtc.Text = "";
                txttdv.Text = "";
                txttc.Text = "";           
            }
        }

        private void dgvTiencong_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int t = dgvTiencong.CurrentCell.RowIndex;
            txttmtc.Text = dgvTiencong.Rows[t].Cells[0].Value.ToString();
            txttdv.Text = dgvTiencong.Rows[t].Cells[1].Value.ToString();
            txttc.Text = dgvTiencong.Rows[t].Cells[2].Value.ToString();
        }
    }
}
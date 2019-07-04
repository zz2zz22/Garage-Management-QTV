﻿using TenPhuTungDAO;
using TenPhuTungDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TenPhuTungBUS
{
    public class PhuTungBUS
    {
        private PhuTungDAO ptDao;
        public PhuTungBUS()
        {
            ptDao = new PhuTungDAO();
        }

        public List<PhuTungDTO> select()
        {
            return ptDao.select();
        }
        public List<PhuTungDTO> selectgia(string sKeyword)
        {
            return ptDao.selectgia(sKeyword);
        }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataManager.Model;

namespace MVCGUI.Models
{
    public class PurchaseListView
    {
        public int? good { get; set; }

        public IEnumerable<Purchase> Purchases { get; set; }
        public PagingInfo paginginfo { get; set; }
    }
}


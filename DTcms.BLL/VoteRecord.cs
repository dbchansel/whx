﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using DTcms.Common;

namespace DTcms.BLL
{
    public partial class VoteRecord
    {
        private readonly Model.sysconfig sysConfig = new BLL.sysconfig().loadConfig(); //获得系统配置信息
        private readonly DAL.VoteRecord dal;

        public VoteRecord()
        {
            dal = new DAL.VoteRecord(sysConfig.sysdatabaseprefix);
        }

        #region 基本方法================================
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            return dal.Exists(id);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.VoteRecord model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.VoteRecord model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.VoteRecord GetModel(int id)
        {
            return dal.GetModel(id);
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
        #endregion

        #region 扩展方法================================
        /// <summary>
        /// 查询名称是否存在
        /// </summary>
        public bool Exists(string name)
        {
            return dal.Exists(name);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.VoteRecord GetModel(string name)
        {
            return dal.GetModel(name);
        }

        /// <summary>
        /// 取得所有列表
        /// </summary>
        public DataTable GetList(int parent_id, string nav_type)
        {
            return dal.GetList(parent_id, nav_type);
        }

        /// <summary>
        /// 取得所有列表
        /// </summary>
        public DataTable GetAllList(string id)
        {
            return dal.GetAllList(id);
        }


        /// <summary>
        /// 取得所有列表
        /// </summary>
        public DataTable GetList1()
        {
            return dal.GetList1();
        }
        // //1，判断是否个人超过每日每用户投票数量 Rules_PDUVotes
        public int GetCurDayCurVoteCount(string openid,int id)
        {
            return dal.GetCurDayCurVoteCount(openid,id);
        }
        //2，判断是否个人超过每人最多投票数量 
        public int GetCurDayCount(string openid)
        {
            return dal.GetCurDayCount(openid);
        }
        public int GetDateInterval(string openid)
        {
            return dal.GetDateInterval(openid);
        }
        


        /// <summary>
        /// 取得所有列表
        /// </summary>
        public DataTable GetList2(string num, string ss = "")
        {
            return dal.GetList2(num, ss);
        }

        /// <summary>
        /// 取得所有列表
        /// </summary>
        public DataTable GetList3()
        {
            return dal.GetList3();
        }

        /// <summary>
        /// 根据导航的名称查询其ID
        /// </summary>
        /// <param name="nav_name">菜单名称</param>
        /// <returns>int</returns>
        public int GetNavId(string nav_name)
        {
            return dal.GetNavId(nav_name);
        }

        /// <summary>
        /// 快捷添加系统默认导航
        /// </summary>
        /// <param name="parent_name">父导航名称</param>
        /// <param name="nav_name">导航名称</param>
        /// <param name="title">导航标题</param>
        /// <param name="link_url">链接地址</param>
        /// <param name="sort_id">排序数字</param>
        /// <param name="channel_id">所属频道ID</param>
        /// <param name="action_type">操作权限以英文逗号分隔开</param>
        /// <returns>int</returns>
        public int Add(string parent_name, string nav_name, string title, string link_url, int sort_id, int channel_id, string action_type)
        {
            return dal.Add(parent_name, nav_name, title, link_url, sort_id, channel_id, action_type);
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public bool UpdateField(int id, string strValue)
        {
            return dal.UpdateField(id, strValue);
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public bool UpdateField(string name, string strValue)
        {
            return dal.UpdateField(name, strValue);
        }
        #endregion
    }
}

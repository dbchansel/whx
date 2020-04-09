using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using DTcms.Common;

namespace DTcms.BLL
{
    /// <summary>
    ///系统导航菜单
    /// </summary>
    public partial class VoteJoin
    {
        private readonly Model.sysconfig sysConfig = new BLL.sysconfig().loadConfig(); //获得系统配置信息
        private readonly DAL.VoteJoin dal;

        public VoteJoin()
        {
            dal = new DAL.VoteJoin(sysConfig.sysdatabaseprefix);
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
        public int Add(Model.VoteJoin model)
        {
            return dal.Add(model);
        }

        //锁定功能
        private void LockRank(Model.VoteJoin model)
        {
            Model.Vote modelVote = new BLL.Vote().GetModel(model.VoteId);
            //必须6小时之内，开启了锁定第一名，并且活动在投票当中
            if ((modelVote.Activity_VoteEDTime - DateTime.Now).TotalHours > 6 || modelVote.OpenLockRank == 0 || modelVote.VoteSta == 2 || modelVote.VoteSta == 1)
                return;
            /*-----------------锁定功能-----------------*/
            //锁定排名功能只在最后6小时内启用！！！
            //锁定第一名判断
            int User1Id = -1;
            //锁定第二名判断
            int User2Id = -1;
            //锁定第三名判断
            int User3Id = -1;

            int curRank = 3;

            DAL.Vote dalvote = new DAL.Vote(sysConfig.sysdatabaseprefix);
            Model.Vote v = new BLL.Vote().GetModel(model.VoteId);
            User1Id = v.User1Id;
            User2Id = v.User2Id;
            User3Id = v.User3Id;
            if (User1Id == -1 && User2Id == -1 && User3Id == -1)
            {

            }
            else
            {
                if (model.VoteId == User1Id)
                    curRank = 0;
                if (model.VoteId == User2Id)
                    curRank = 1;
                if (model.VoteId == User3Id)
                    curRank = 2;
                int[] rankArray = { User1Id, User1Id, User1Id,0};
                UpdateVoten_V(curRank, rankArray, model.VoteNum);
                if (curRank == 0)
                {
             //       UpdateVoten_V(curRank, rankArray, model.VoteNum);
                    /*
                    Model.VoteJoin vj3 = new BLL.VoteJoin().GetModel(User3Id);
                    if (model.VoteNum > vj3.VoteNum)
                    {
                        vj3.VoteNum = model.VoteNum + (new Random()).Next(1, (new Random()).Next(2, 10));
                        dal.Update(vj3);

                        Model.VoteJoin vj2 = new BLL.VoteJoin().GetModel(User2Id);
                        if (vj3.VoteNum > vj2.VoteNum)
                        {
                            vj2.VoteNum = vj3.VoteNum + (new Random()).Next(1, (new Random()).Next(1, 7));
                            dal.Update(vj2);
                            Model.VoteJoin vj1 = new BLL.VoteJoin().GetModel(User1Id);
                            if (vj2.VoteNum > vj1.VoteNum)
                            {
                                vj1.VoteNum = vj2.VoteNum + (new Random()).Next(1, (new Random()).Next(1, 5));
                                dal.Update(vj1);
                            }
                        }
                    }
                    */

                }
            }
        }

        private void UpdateVoten_V(int pointRank,int[] rankArray,int curVoteNum)
        {
            if (pointRank == -1)
                return;

            rankArray[pointRank] = curVoteNum;
            if (rankArray[pointRank] != -1)
            {
                Model.VoteJoin vj = new BLL.VoteJoin().GetModel(rankArray[pointRank]);
                if(vj == null)
                    UpdateVoten_V((pointRank - 1), rankArray, curVoteNum);

                int localVoteNum = vj.VoteNum;
                if (curVoteNum > localVoteNum)
                {
                    vj.VoteNum = curVoteNum + (new Random()).Next(1, (new Random()).Next(1, 7));
                    if (new BLL.VoteJoin().Update(vj))
                        UpdateVoten_V(pointRank - 1, rankArray, vj.VoteNum);
                }
            }
            else
            {
                UpdateVoten_V((pointRank - 1), rankArray, curVoteNum);
            }

        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.VoteJoin model)
        {

           try { LockRank(model); } catch (Exception ex) { }

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
        public Model.VoteJoin GetModel(int id)
        {
            return dal.GetModel(id);
        }

        public int GetJoinNum(int id)
        {
            return dal.GetJoinNum(id);
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
        public Model.VoteJoin GetModel(string name)
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
        public DataTable GetList1(int id)
        {
            return dal.GetList1(id);
        }

        /// <summary>
        /// 取得所有列表
        /// </summary>
        public DataTable GetList2(int id)
        {
            return dal.GetList2(id);
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
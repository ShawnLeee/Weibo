//
//  DWWeiboMacros.h
//  Weibo
//
//  Created by Daniel on 16/2/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#ifndef DWWeiboMacros_h
#define DWWeiboMacros_h
//微博读取借口
#define StatusesPublicTimelineURL @"statuses/public_timeline.json" //获取最新的公共微博
#define StatusesFriendsTimelineURL @"statuses/friends_timeline.json" //获取当前登录用户及其所关注用户的最新微博
#define StatusesHomeTimelineURL @"statuses/home_timeline.json" //获取当前登录用户及其所关注用户的最新微博
#define StatusesFriendsTimelineIdsURL @"statuses/friends_timeline/ids.json" //获取当前登录用户及其所关注用户的最新微博的ID
#define StatusesUserTimelineURL @"statuses/user_timeline.json" //获取用户发布的微博
#define StatusesFriendsTimelineIdsURL @"statuses/friends_timeline/ids.json" //获取用户发布的微博的ID
#define StatusesRepostTimelineURL @"statuses/repost_timeline.json" //返回一条原创微博的最新转发微博
#define StatusesRepostTimelineIdsURL @"statuses/repost_timeline/ids.json" //获取一条原创微博的最新转发微博的ID
#define StatusesMentionsURL @"statuses/mentions.json" //获取@当前用户的最新微博
#define StatusesMentionsIdsURL @"statuses/mentions/ids.json" //获取@当前用户的最新微博的ID
#define StatusesBilateralTimelineURL @"statuses/bilateral_timeline.json" //获取双向关注用户的最新微博
#define StatusesShowURL @"statuses/show.json" //根据ID获取单条微博信息
#define StatusesQuerymidURL @"statuses/querymid.json" //通过id获取mid
#define StatusesQueryidURL @"statuses/queryid.json" //通过mid获取id
#define StatusesCountURL @"statuses/count.json" //批量获取指定微博的转发数评论数
#define StatusesGoURL @"statuses/go" //根据ID跳转到单条微博页
#define StatusesEmotionsURL @"emotions.json" //获取官方表情
//微博写入接口

#define StatusesRepostURL @"statuses/repost.json" //转发一条微博信息
#define StatusesDestoryURL @"statuses/destroy.json" //删除微博信息
#define StatusesUpdateURL @"statuses/update.json" //发布一条微博信息
#define StatusesUploadURL @"statuses/upload.json" //上传图片并发布一条微博

//评论读取接口

#define ShowCommentsURL @"comments/show.json" //获取某条微博的评论列表
#define ByMeCommentsURL @"comments/by_me.json" //我发出的评论列表
#define ToMeCommentsURL @"comments/to_me.json" //我收到的评论列表
#define TimeLineCommentsURL @"comments/timeline.json" //获取用户发送及收到的评论列表
#define MentionsCommnentsURL @"comments/mentions.json" //获取@到我的评论
#define ShowBatchCommentsURL @"comments/show_batch.json" // 批量获取评论内容


//评论写入接口
#define CreateCommentsURL @"comments/create.json" //评论一条微博
#define DestoryCommentsURL @"comments/destroy.json" //删除一条评论
#define DestoryBatchCommentsURL @"comments/destroy_batch.json" //批量删除评论
#define ReplyCommentsURL @"comments/reply.json" //回复一条评论

#endif /* DWWeiboMacros_h */

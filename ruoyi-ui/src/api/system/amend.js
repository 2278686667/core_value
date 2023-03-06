import request from '@/utils/request'

// 查询评分记录表修正列表
export function listAmend(query) {
  return request({
    url: '/system/amend/list',
    method: 'get',
    params: query
  })
}

// 查询评分记录表修正详细
export function getAmend(id) {
  return request({
    url: '/system/amend/' + id,
    method: 'get'
  })
}

// 新增评分记录表修正
export function addAmend(data) {
  return request({
    url: '/system/amend',
    method: 'post',
    data: data
  })
}

// 修改评分记录表修正
export function updateAmend(data) {
  return request({
    url: '/system/amend',
    method: 'put',
    data: data
  })
}

// 删除评分记录表修正
export function delAmend(id) {
  return request({
    url: '/system/amend/' + id,
    method: 'delete'
  })
}
// 查询评分记录表列表
export function listMark(query) {
  return request({
    url: '/system/mark/listAdmin',
    method: 'get',
    params: query
  })
}

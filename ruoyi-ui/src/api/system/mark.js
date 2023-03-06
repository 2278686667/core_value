import request from '@/utils/request'

// 查询评分记录表列表
export function listMark(query) {
  return request({
    url: '/system/mark/list',
    method: 'get',
    params: query
  })
}

// 查询评分记录表详细
export function getMark(id) {
  return request({
    url: '/system/mark/' + id,
    method: 'get'
  })
}

// 新增评分记录表
export function addMark(data) {
  return request({
    url: '/system/mark',
    method: 'post',
    data: data
  })
}

// 修改评分记录表
export function updateMark(data) {
  return request({
    url: '/system/mark',
    method: 'put',
    data: data
  })
}

// 删除评分记录表
export function delMark(id) {
  return request({
    url: '/system/mark/' + id,
    method: 'delete'
  })
}

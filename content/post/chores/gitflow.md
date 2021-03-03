---
title: "Gitflow"
date: 2021-02-23T00:53:36+07:00
tags:
  - git
  - gitflow
---
## Gitflow
![Gitflow](https://wac-cdn.atlassian.com/dam/jcr:61ccc620-5249-4338-be66-94d563f2843c/05%20(2).svg?cdnVersion=1476)
Là một flow làm việc được sử dụng phổ biến ở các công ty về lập trình để thực hiện quá trình phát triển phần mềm. Một lập trình bắt buộc phải biết và thực hiện thành thạo gitflow. Khi làm việc theo Gitflow, lập trình viên sẽ làm việc với các loại branches: `master, develop, hotfix, feature, release`, trong đó:
- `master` là nơi được sử dụng để lưu các phiên bản stable để release cho người sử dụng
- `develop` là nhánh được sử dụng nơi chứa tổng hợp các tính năng đã hoàn thành
- `feature` là các nhánh để phát triển một tính năng nào đó
- `release` chứa một phiên bản stable
- `hotfix` là nhánh thực hiện một bản chỉnh sửa một lỗi nào đó của nhánh `master`
## Ví dụ về các flow làm việc chính

**Init flow:**
```c++
git checkout master
git checkout -b develop
```
**Develop a feature:**
```c++
git checkout -b feature_branch
/* deal with feature_branch*/
git checkout develop
git merge feature_branch
git branch -D feature_branch
```
**Release:**
```c++
git checkout -b release/0.1.0
/* prepare for release*/
git checkout master
git merge release/0.1.0
git checkout develop
git merge release/0.1.0
```
**Hotfix on master:**
```c++
git checkout master
git checkout -b hotfix_branch
/* fix bug*/
git checkout master
git merge hotfix_branch
git checkout develop
git merge hotfix_branch
git branch -D hotfix_branch
```
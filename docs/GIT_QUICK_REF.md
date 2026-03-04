# Git 快速参考卡

> 常用Git命令速查，打印出来贴在显示器旁

---

## 🚀 基础操作

```bash
# 查看当前状态
git status

# 查看提交历史
git log --oneline
git log --oneline -5          # 最近5条
```

---

## 📝 提交代码

```bash
# 添加并提交
git add .
git commit -m "描述你的修改"

# 查看要提交什么
git diff --staged
```

---

## 🌲 分支操作

```bash
# 创建学习分支
git checkout -b learn-4607eb5 4607eb5

# 返回主分支
git checkout master

# 删除学习分支
git branch -D learn-4607eb5

# 查看所有分支
git branch -a
```

---

## 👀 查看代码

```bash
# 查看某个commit
git show 4607eb5

# 查看某个文件在某个commit的内容
git show 4607eb5:src/libs/splitters/base.py

# 查看某个commit修改了哪些文件
git show 4607eb5 --stat
```

---

## 🔄 撤销操作

```bash
# 撤销工作区修改
git restore 文件名

# 撤销暂存区
git restore --staged 文件名

# 撤销上一次提交（保留修改）
git reset --soft HEAD~1
```

---

## 📦 同步代码

```bash
# 推送到GitHub
git push

# 从GitHub拉取
git pull
```

---

## 🎓 学习项目专用

```powershell
# 切换到学习起点
.\scripts\switch-commit.ps1 4607eb5

# 查看某个commit
.\scripts\learn-commit.ps1 4607eb5

# 返回最新代码
.\scripts\switch-commit.ps1 -Commit 4607eb5 -ReturnToMaster
```

---

## ⚠️ 常见问题

```bash
# 文件被锁定无法切换
git stash
git stash pop

# 查看Git配置
git config --list

# 配置用户信息
git config user.name "你的名字"
git config user.email "你的邮箱"
```

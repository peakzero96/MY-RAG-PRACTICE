# Git 零基础使用指南

> 面向初学者的完整Git教程，配合MODULAR-RAG-MCP-SERVER学习项目使用

---

## 📚 目录

1. [Git是什么](#1-git是什么)
2. [核心概念](#2-核心概念)
3. [基础命令](#3-基础命令)
4. [学习项目中的Git使用](#4-学习项目中的git使用)
5. [不同电脑间同步代码](#5-不同电脑间同步代码)
6. [常见问题解决](#6-常见问题解决)
7. [快速参考](#7-快速参考)

---

## 1. Git是什么

### 简单理解

**Git就是一个"时光机"**，可以：

- 📸 **拍照**：保存你的代码在某个时刻的状态
- ⏮️ **回溯**：随时回到之前的任意状态
- 🔄 **分支**：创建平行宇宙，尝试不同的想法
- 🤝 **协作**：和他人一起修改代码，不会互相覆盖

### 为什么需要Git

```
没有Git：
    code_v1.py
    code_v2.py
    code_v3.py
    code_final.py
    code_final_真的final.py
    😫 文件名混乱，不知道哪个是最新版本

有Git：
    project/  (Git自动记录所有历史)
    😊 清爽整洁，随时查看任意版本
```

---

## 2. 核心概念

### 2.1 仓库 (Repository)

**仓库**就是Git管理代码的文件夹。

```bash
my-rag-practice/          # 你的项目文件夹
├── .git/                # 隐藏的Git文件夹（"时光机"的核心）
├── src/                 # 源代码
├── config/              # 配置文件
└── ...                  # 其他文件
```

**💡 记住**：只要有 `.git` 文件夹，这个目录就是Git仓库。

---

### 2.2 工作区、暂存区、本地仓库

想象Git是一个三层楼：

```
┌─────────────────────────────────────────┐
│  本地仓库 (Repository)                   │
│  ← 存储所有历史版本                    │
│  ← git commit 会把暂存区内容存到这里   │
└─────────────────────────────────────────┘
                    ↑ git commit
┌─────────────────────────────────────────┐
│  暂存区 (Staging Area)                 │
│  ← 等待提交的文件                      │
│  ← git add 会把工作区文件放这里       │
└─────────────────────────────────────────┘
                    ↑ git add
┌─────────────────────────────────────────┐
│  工作区 (Working Directory)             │
│  ← 你实际编辑文件的地方                │
│  ← VSCode打开看到的文件                │
└─────────────────────────────────────────┘
```

---

### 2.3 提交 (Commit)

**提交**就像是给代码拍一张照片，记录下这一刻的状态。

```
Commit哈希: 4607eb5            ← 照片的唯一ID
作者:      jerry-ai-dev      ↓
日期:      2025-01-27        ↓
消息:      feat(B3): add    ↓
           splitter base    ↓
                          ↓
        ┌─────────────────┐
        │  代码快照        │ ← 这一刻的所有文件
        └─────────────────┘
```

---

### 2.4 分支 (Branch)

**分支**就像是平行宇宙，你可以在不同分支上做不同的事情。

```
主分支 (master)
    ├── Commit A
    ├── Commit B
    └── Commit C

学习分支 (learn-4607eb5)
    ├── Commit A (从master复制)
    └── 你的修改...
```

---

## 3. 基础命令

### 3.1 查看状态

```bash
# 查看当前状态（最常用！）
git status

# 输出示例：
# On branch master
# Changes not staged for commit:
#   modified:   src/test.py
#   new file:   src/new.py
```

**🎯 使用场景**：
- 每次修改代码后，先用这个命令看看有什么变化
- 确认哪些文件被修改了、新增了、删除了

---

### 3.2 查看历史

```bash
# 查看提交历史（简洁版）
git log --oneline

# 输出示例：
# 4607eb5 feat(B3): add splitter base + factory
# 008a00b feat(B4): implement VectorStore
# b618489 feat(B5): add base and factory reranker

# 查看最近5条历史
git log --oneline -5

# 查看详细历史（图形化）
git log --graph --oneline --all
```

**🎯 使用场景**：
- 查看项目的开发历史
- 找到某个功能的commit哈希
- 了解谁在什么时候改了什么

---

### 3.3 提交代码

```bash
# 第一步：查看有哪些变化
git status

# 第二步：添加文件到暂存区
git add 文件名          # 添加单个文件
git add .               # 添加所有文件
git add src/            # 添加src文件夹下所有文件

# 第三步：提交到本地仓库
git commit -m "写清楚你做了什么"

# 示例：
git commit -m "feat(B3): add splitter base + factory"
git commit -m "fix: 修复查询bug"
git commit -m "docs: 更新README"
```

**🎯 Commit消息规范**：

| 类型 | 说明 | 示例 |
|------|------|------|
| `feat:` | 新功能 | `feat: 添加用户登录功能` |
| `fix:` | 修复bug | `fix: 修复查询参数错误` |
| `docs:` | 文档更新 | `docs: 更新API文档` |
| `refactor:` | 重构代码 | `refactor: 优化查询逻辑` |
| `test:` | 测试 | `test: 添加单元测试` |

---

### 3.4 查看差异

```bash
# 查看文件修改了什么
git diff 文件名

# 查看暂存区和工作区的差异
git diff --staged

# 查看两个commit之间的差异
git diff 第一个commit 第二个commit
```

**🎯 使用场景**：
- 提交前确认自己改了什么
- 对比两个版本的区别
- 检查是否修改了不该修改的文件

---

### 3.5 撤销操作

```bash
# 撤销工作区的修改（危险！会丢失修改）
git restore 文件名

# 撤销暂存区的文件（保留工作区修改）
git restore --staged 文件名

# 撤销上一次提交（保留修改）
git reset --soft HEAD~1

# 撤销上一次提交（丢弃修改）
git reset --hard HEAD~1

# ⚠️ 警告：--hard 会永久删除代码！
```

---

## 4. 学习项目中的Git使用

### 4.1 切换到特定commit学习

```bash
# 方法一：创建学习分支（推荐）
git checkout -b learn-4607eb5 4607eb5

# 现在你在学习分支了
# 可以查看这个commit的代码
# 修改文件不会影响master分支

# 学习完成后返回master
git checkout master

# 删除学习分支
git branch -D learn-4607eb5
```

```bash
# 方法二：使用我们的切换脚本
.\scripts\switch-commit.ps1 4607eb5
# 学习
.\scripts\switch-commit.ps1 -Commit 4607eb5 -ReturnToMaster
```

---

### 4.2 查看某个commit的内容

```bash
# 查看commit信息
git show 4607eb5

# 只查看某个文件的变更
git show 4607eb5:src/libs/splitters/base.py

# 查看commit修改了哪些文件
git show 4607eb5 --stat
```

---

### 4.3 对比原始项目和学习项目

```bash
# 在学习项目中
cd E:\code\McpRagServer\my-rag-practice

# 查看当前分支的代码
git status
git log --oneline

# 查看某个commit
git show 4607eb5
```

---

### 4.4 标记学习进度

```bash
# 学完一个commit后，提交代码
git add .
git commit -m "learn(4607eb5): 完成splitter base学习"

# 或者用空提交标记进度
git commit --allow-empty -m "progress: 阶段零完成50%"
```

---

### 4.5 学习项目工作流

```bash
# 1. 切换到学习起点
.\scripts\switch-commit.ps1 4607eb5

# 2. 在VSCode中查看原始代码
#    - 打开 E:\code\McpRagServer\MODULAR-RAG-MCP-SERVER
#    - 查看该commit的代码实现

# 3. 在学习项目中自己实现
#    - 打开 E:\code\McpRagServer\my-rag-practice
#    - 对照原始代码，自己编写

# 4. 提交你的实现
git add .
git commit -m "feat(4607eb5): 实现splitter base和factory"

# 5. 切换到下一个commit
.\scripts\switch-commit.ps1 -ReturnToMaster
.\scripts\switch-commit.ps1 008a00b
```

---

## 5. 不同电脑间同步代码

### 5.1 使用GitHub（推荐）

#### 第一次在新电脑上

```bash
# 1. 克隆你的学习项目
git clone https://github.com/你的用户名/my-rag-practice.git
cd my-rag-practice

# 2. 激活Conda环境
conda activate rag-learning

# 3. 继续学习
git log --oneline
```

#### 每天学习完成后

```bash
# 1. 提交今天的进度
git add .
git commit -m "progress: 完成阶段零学习"

# 2. 推送到GitHub
git push origin master
```

#### 在另一台电脑继续

```bash
# 1. 拉取最新代码
git pull origin master

# 2. 查看学习进度
git log --oneline -5
cat LEARNING_PROGRESS.md

# 3. 继续学习
```

---

### 5.2 使用U盘/网盘同步

```bash
# 方案一：打包整个项目文件夹
# 复制 my-rag-practice 文件夹到U盘

# 方案二：创建备份脚本
.\scripts\backup.ps1
```

创建备份脚本：

```powershell
# backup.ps1
$BACKUP_DIR = "E:\GitBackup\my-rag-practice"
$SOURCE_DIR = "E:\code\McpRagServer\my-rag-practice"

# 创建备份目录
if (!(Test-Path $BACKUP_DIR)) {
    New-Item -ItemType Directory -Path $BACKUP_DIR -Force
}

# 复制文件
Copy-Item -Path $SOURCE_DIR\* -Destination $BACKUP_DIR -Recurse -Force

Write-Host "✅ 备份完成: $BACKUP_DIR" -ForegroundColor Green
```

---

### 5.3 使用Git Bundle（适合无网络环境）

```bash
# 在有网络的电脑上打包
git bundle create my-rag-practice.bundle --all

# 复制 .bundle 文件到U盘

# 在没有网络的电脑上解包
git clone my-rag-practice.bundle
```

---

## 6. 常见问题解决

### 6.1 "文件被修改但没保存"

```bash
# 查看状态
git status

# 如果看到红色文件，说明有未保存的修改
git restore .    # ⚠️ 会丢失所有修改！

# 正确做法：
git stash          # 暂存当前修改
git stash pop     # 恢复修改
```

---

### 6.2 "提交错了想撤回"

```bash
# 撤销上一次提交，保留修改
git reset --soft HEAD~1

# 修改后重新提交
git add .
git commit -m "正确的提交消息"
```

---

### 6.3 "想看某个版本的代码"

```bash
# 查看某个commit
git show 4607eb5

# 切换到某个commit（查看模式）
git checkout 4607eb5

# 查看完后回到最新
git checkout master
```

---

### 6.4 "忘记提交了某些文件"

```bash
# 查看当前状态
git status

# 添加遗漏的文件
git add 遗漏的文件.py

# 修改上一次提交
git commit --amend --no-edit
```

---

### 6.5 "VSCode显示文件被修改但实际没改"

```bash
# 可能是换行符问题
git config core.autocrlf false

# 然后重新查看
git status
```

---

## 7. 快速参考

### 常用命令速查表

| 操作 | 命令 |
|------|------|
| 查看状态 | `git status` |
| 查看历史 | `git log --oneline` |
| 添加文件 | `git add .` |
| 提交 | `git commit -m "消息"` |
| 查看差异 | `git diff` |
| 撤销修改 | `git restore 文件名` |
| 切换分支 | `git checkout 分支名` |
| 创建分支 | `git checkout -b 新分支名` |
| 删除分支 | `git branch -D 分支名` |

### 学习项目专用命令

```bash
# 切换到学习起点
.\scripts\switch-commit.ps1 <commit-sha>

# 查看某个commit
.\scripts\learn-commit.ps1 <commit-sha>

# 返回最新代码
.\scripts\switch-commit.ps1 -ReturnToMaster
```

### Commit消息模板

```bash
# 学习进度提交
git commit -m "progress: 完成阶段零 50%"

# 功能实现提交
git commit -m "feat(4607eb5): 实现splitter base"

# 笔记提交
git commit -m "notes: 今天学习了抽象基类设计模式"

# 问题记录提交
git commit -m "todo: 需要学习工厂模式"
```

---

## 8. 实战练习

### 练习1：创建你的第一次提交

```bash
# 1. 在学习目录中创建一个测试文件
echo "print('Hello Git!')" > test.py

# 2. 查看状态
git status
# 应该看到红色显示 test.py 是未跟踪文件

# 3. 添加到暂存区
git add test.py
# test.py 变成绿色

# 4. 提交
git commit -m "test: 我的第一个提交"

# 5. 查看历史
git log --oneline
```

---

### 练习2：学习分支切换

```bash
# 1. 创建学习分支
git checkout -b practice-branch

# 2. 修改文件
echo "print('Branch')" >> test.py

# 3. 提交
git add .
git commit -m "test: 在学习分支修改"

# 4. 返回主分支
git checkout master

# 5. 查看test.py
cat test.py
# 应该看不到"Branch"

# 6. 删除练习分支
git branch -D practice-branch
```

---

### 练习3：查看历史版本

```bash
# 1. 查看历史
git log --oneline

# 2. 选择一个commit
git show <commit-hash>

# 3. 临时切换查看
git checkout <commit-hash>

# 4. 查看test.py
cat test.py

# 5. 返回最新
git checkout master
```

---

## 9. GitHub使用（可选）

### 9.1 创建远程仓库

1. 访问 https://github.com
2. 点击右上角 `+` → `New repository`
3. 仓库名：`my-rag-practice`
4. 设为私有或公开
5. 点击 `Create repository`

### 9.2 关联本地仓库

```bash
# 添加远程仓库地址
git remote add origin https://github.com/你的用户名/my-rag-practice.git

# 推送代码
git push -u origin master
```

### 9.3 日常同步

```bash
# 每次学习完成后
git add .
git commit -m "progress: 今日学习进度"
git push

# 换电脑后
git pull
```

---

## 10. 小贴士

### ✅ 好习惯

1. **经常提交**：每完成一个小功能就提交
2. **写清楚的提交消息**：让自己以后看得懂
3. **学习前先拉取最新代码**：`git pull`
4. **定期备份**：推送到GitHub或复制到U盘

### ❌ 坏习惯

1. **长时间不提交**：代码丢失风险高
2. **提交消息不清楚**：`update`、`fix`、`111` 都不好
3. **随便重置**：`git reset --hard` 很危险
4. **不拉取就推送**：可能导致冲突

---

## 11. 获取帮助

### 查看Git帮助

```bash
# 查看某个命令的帮助
git help commit
git help add
git help log
```

### 实用资源

- **官方文档**：https://git-scm.com/doc
- **可视化教程**：https://learngitbranching.js.org/
- **练习游戏**：https://learngitbranching.js.org/

---

## 📝 学习检查清单

使用本指南前，请确保：

- [ ] 已安装Git
- [ ] 已配置Git用户信息
- [ ] 已创建学习项目目录
- [ ] 已创建Conda环境 `rag-learning`

---

**祝你学习愉快！** 🚀

# 目的

此项目目录是快速下载 centos 包及生成 repo 目录.

# 实现方式

以 centos 为基础镜像, 使用 repotrack 下载需要的包及其依赖, 使用 createrepo 来创建 repo.

根据实际情况, 修改 Dockerfile, 选取所需的 centos 版本.

目前里面有 postgresql, docker epel 的 repo, 如有需要再在 Dockerfile 中添加其他的 repo.

# 使用方式

1. 构建镜像: `./build.sh`
2. 下载包: `./download.sh <repo-name> <package-name>`
    示例: `./download.sh local docker-ce`
    在当前目录下会创建 ./repos/local 目录, 里面是下好的包

可以使用 `./download.sh bash` 来直接进入容器, 测试你想下载的包.

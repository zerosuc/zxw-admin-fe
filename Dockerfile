# 第一个阶段：构建阶段
FROM node:18 AS build

WORKDIR /web

# 复制代码到工作目录
COPY . .

# 安装 pnpm 并使用它安装依赖和构建项目
# mac上面打包需要否则报错oom
ENV NODE_OPTIONS="--max-old-space-size=8192"
RUN yarn  && yarn run build:prod

# 第二个阶段：生产阶段
FROM nginx:alpine

# 创建目录并复制构建结果到 Nginx 目录
RUN mkdir /usr/share/nginx/html/dist

COPY ./nginx/default.conf /etc/nginx/conf.d/default.template
COPY --from=build /web/dist /usr/share/nginx/html/dist

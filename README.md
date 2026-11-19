# Awesome Imouto

收集日本动漫与 Galgame 中的妹妹角色，使用 Jekyll + Chirpy 展示。

## 内容维护

- `_posts/`：一位角色一篇资料，保留已有条目的文件名以维持原链接。
- `_tabs/characters.md`：根据角色 front matter 自动生成关系目录与数量。
- `_tabs/about.md`：收录原则与来源规则。
- `_tabs/research.md`：复杂关系、称呼与待补证据的核验记录。
- `_includes/character-profile.html`、`character-sources.html`：统一渲染基本信息与来源。

复制 [角色模板](docs/character-template.markdown) 到 `_posts/YYYY-MM-DD-角色名.markdown`。填写 `character: true`、中日文名、作品、兄姊、关系、媒介与来源；`categories` 第二项必须与 `relation` 一致。`relation` 使用“实妹”“义妹”或“血缘待核”，后者只用于妹妹身份已确认但血缘依据不足的角色。复杂关系填写 `relation_detail`。`voice` 可省略，确认后须注明版本和来源。图片为可选项。

`date` 为条目发布日期，不是作品发行日期；`verified_on` 为资料核对日期。正文与摘要使用自己的中文概述，来源的 `supports` 说明该链接支持哪些字段。使用既有的 `日漫`、`galgame` 标签，方便主题的分类与检索。

## 本地预览

需要 Ruby 3.4 与 Bundler。

```sh
bundle install
bundle exec jekyll serve --baseurl /awesome-imouto
```

打开 `http://127.0.0.1:4000/awesome-imouto/`。构建检查：

```sh
bundle exec jekyll build --baseurl /awesome-imouto
```

PR 会运行 Jekyll 构建检查。合并到 `master` 后由现有 GitHub Pages 工作流发布。

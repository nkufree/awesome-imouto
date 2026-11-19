---
title: 角色目录
icon: fas fa-list
order: 0
---

按妹妹关系浏览角色。点击姓名进入资料页；各页列出日文名、兄姊、配音版本与来源。也可以使用站内搜索查询角色或作品。

{% assign characters = site.posts | where: 'character', true | sort: 'title' %}
{% assign related = characters | where: 'relation', '实妹' %}
{% assign adopted = characters | where: 'relation', '义妹' %}
{% assign unclassified = characters | where: 'relation', '血缘待核' %}

当前收录 **{{ characters.size }}** 位：实妹 **{{ related.size }}** 位，义妹 **{{ adopted.size }}** 位，妹妹身份已确认但血缘分类待核 **{{ unclassified.size }}** 位。

“实妹”包括亲生及同父异母、同母异父的妹妹；“义妹”描述因收养或父母再婚等形成的家庭身份。表亲兼义妹等情况在角色页另行说明，不能一概写成完全无血缘。妹妹对应的对象列在“兄姊”栏中。

[查看收录考据与容易混淆的关系]({{ '/research/' | relative_url }})

## 实妹

| 角色 | 作品 | 兄姊 | 媒介 |
| :-- | :-- | :-- | :-- |
{% for character in related -%}
| [{{ character.title }}]({{ character.url | relative_url }}) | {{ character.subtitle }} | {{ character.sibling }} | {{ character.media | join: '、' }} |
{% endfor %}

## 义妹

| 角色 | 作品 | 兄姊 | 媒介 |
| :-- | :-- | :-- | :-- |
{% for character in adopted -%}
| [{{ character.title }}]({{ character.url | relative_url }}) | {{ character.subtitle }} | {{ character.sibling }} | {{ character.media | join: '、' }} |
{% endfor %}

## 妹妹身份确认，血缘分类待核

以下角色已由官网确认妹妹身份，但本次找到的资料不足以明确区分实妹、义妹。她们计入收录总数，不计入前两类，待补充设定出处后再归类。

| 角色 | 作品 | 哥哥 | 媒介 |
| :-- | :-- | :-- | :-- |
{% for character in unclassified -%}
| [{{ character.title }}]({{ character.url | relative_url }}) | {{ character.subtitle }} | {{ character.sibling }} | {{ character.media | join: '、' }} |
{% endfor %}

媒介栏标示本次已收录的动画或 Galgame 资料，并非作品全部改编列表。角色页仅介绍基础设定；亲属身份本身有时也会涉及前期剧情。

[收录原则与补充方式]({{ '/about/' | relative_url }})

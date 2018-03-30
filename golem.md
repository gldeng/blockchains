
# Golem

## [白皮书](https://ethfans.org/topics/743)

## [网站](https://golem.network/learn.html)


## 应用

* 渲染
* 大数据机器学习 [^going-forward]

[^going-forward]: https://docs.golem.network/07-golem-integrations.html


## 版本 （0.14.0）
Brass Golem [^brass-golem]

[^brass-golem]: https://github.com/golemfactory/golem/wiki/Roadmap#brass-golem

>● (1) Basic Task Definition Scheme that allows to prepare first task definition;
● (1) Basic Application Registry - first version of Ethereum-based Application Registry
which allows to save tasks defined with basic task definition scheme;
● ~~(1)  IPFS integration for coordinating task data and content delivery, e.g. deliver files
needed to compute a task, deliver the results back to the requester;~~
● (1) Docker environment with Golem-provided images for sandboxing the
computations;
● _(1) Local verification: a probabilistic verification system based on the calculation of a
fraction of the task on the requestor’s machine;_
● (1) Basic UI and CLI;
● (1) Basic reputation system;
● (1) Implementation of  Blender  and  LuxRender  tasks.

## 技术细节

* P2P: pydispatch

## 挑战
* 技术复杂度
* 经济可行性
  >There are two ways users can benefit from our P2P network; providers can rent their computational power to requestors at an affordable rate and price competition among providers will lower the overall cost of computations for requestors.
* 验证

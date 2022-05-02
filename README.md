# gdutarticle
广东工业大学本科生毕业论文模板，也可以用于平时写写作业。

如果你需要的是研究生毕业论文模板，可以看看这个：[gdutthesis](https://github.com/sikouhjw/gdutthesis)

本项目起源于：[gdutart](https://github.com/Nick-Hopps/gdutart) 的 1.0 版本，链接中已更新于 2.0 版本。本科期间写作业用的都是 1.0 版本，在写毕业论文的时候发现许多格式已经不符合现在的要求，所以进行了重构，绝大多数代码已经重新书写。这里十分感谢原作者师兄 [NickHopps](https://github.com/Nick-Hopps)，他编写的模板陪伴我度过了整个本科。

此模板已经帮你处理好绝大多数的样式。只要仿照给出的 `main.tex` 来写即可。如果不想分文件编写，也可以一个 `main.tex` 一把梭（不推荐）。如果使用本模板来编写毕业论文，推荐有一定 Latex 基础，能独立解决一些问题再使用。毕竟本人技术有限，本模板有些地方的实现并不是很优雅，出现问题也在所难免。也欢迎提 Issue 并附上最小样例。

模板是按照手册给定的样式编写。但由于手册写得实在太烂，样张和给定的样式不符合，这里优先按照文字描述优先，无文字描述以样张测量数据优先。


## 封面、书脊
本模板会自动加载封面与书脊，若无需封面，可以使用参数：
```Tex
\documentclass[nocoverpage]{gdutarticle}
```
无需书脊，则使用参数：
```Tex
\documentclass[nospine]{gdutarticle}
```
书脊支持标题中含有英文标题，模板会自动竖排单词，如 `main.pdf` 所示。

## 个人信息
引入个人信息，其中，`subtitle` 和 `submajor` 是可选的。`subtitle` 用于外语论文题目中外文表示。而 `submajor` 则用于处理标题过长的情况，这时得使用者手动断行，将标题置于两行。如 `main.pdf` 所示。

```Tex
\infosetup{
  subject = 本科毕业设计（论文）,
  title  = 汽车动力经济性能计算分析System的设计,
%   subtitle = Design of calculation and analysis system for automobile power economic performance
  college = 机电工程学院,
  major   = 机械设计制造及其自动化,
  submajor   = （车辆工程方向）,
  grade   = 2003级（1）班,
  stuid   = 3103000651,
  name    = 陈杰栋,
  teacher = 樊晶明
}
```

## 目录、参考文献、附录
注意，虽然手册上的样张中，目录是无缩进的，但在实际上老师一般都会要求缩进。所以模板默认是进行缩进的。

```Tex
\makecontent    % 创建目录页
\makereference{参考文献bib文件路径} % 创建参考文献页
\makeappendix{附录名字} % 创建附录页，附录会自动计数
```

## 可使用功能
### GDUTtable 环境
```Tex
\begin{GDUTtable}{\textwidth}{YYY}
    换热器 & 热边压降损失  & 冷边压降损失  \\ \hline
    初级  & 2974.37 & 2931.52 \\
    次级  & 2924.65 & 3789.76 \\
\end{GDUTtable}
```
会自动处理 table 中的字体大小，并在表格上下放置粗线，无需手动添加。值得注意的是，在表格末尾得有 `\\` 表示换行作为结尾。


### 图注命令
`\figurenotation[注：]{注释内容}`。注会放置于图片正下方。

值得注意的是，此命令必须得紧跟在引用的图片后面 `\includegraphics{}` ，不能有空格换行。否则会出现奇怪的空行问题。

可选参数默认为 `注：` 字样，若无需此字样，可中括号留空。如下所示：
```Tex
\begin{figure}[ht]
    \centering
    \includegraphics[width=0.5\textwidth]{example-image}\figurenotation[]{
        1-太阳模拟器；2-单管及31 个PCM 容器；3-气泵；\\
        4-干燥过滤器；5-手动调节阀；6-孔板流量计；\\
        7-空气预热器；8，9-调功器；10-空气换热器.
    }
    \caption{单管换热系统流程图}
    \label{fig:figname1}
\end{figure}
```

### 表注命令
`\tablenotation[注：]{注释内容}` 注会放置于表格左下方。

与图注类似的语法，也必须得紧跟在 `\end{GDUTtable}` （不使用 GDUTtable，使用 tabular 或者 tabularx 也是如此）后面。

```Tex
\begin{table}[ht]
    \begin{GDUTtable}{Y}
        ……
    \end{GDUTtable}\tablenotation{这是注}
\end{table}
```
### 底注命令
`\notation[注：]{注释内容}` 注会放置于页面底部。

（感觉没有人会用这个命令吧，要不是样张里有，本来也不会实现这个功能。）

语法与上述类似，使用样例如下：
```Tex
\notation{
    本设计（论文）选题来源于 XXX 项目（编号）……
}
```
### 引用相关
引用图片样例如下：
- 只引用编号：`\ref{fig:figname1} `3.2
- 引用类型和编号：`\autoref{fig:figname1}` 图 3.2
- 引用类型、编号、标题：`\fullref{fig:figname1}` 图 3.2 单管换热系统流程图


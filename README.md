# zhiliangyu
玉器展示网站（练习用）

## 模块说明

- zhiliangyu-service 提供画面和服务接口
- zhiliangyu-dalgen 提供数据库访问

## mybatis dalgen

mybatis delgen是一个maven插件，将项目中repository放入本地maven仓库中。
cd 到项目zhiliangyu-dalgen，然后执行mvn mybatis:gen运行此插件

```$xslt
cd zhiliangyu-dalgen
zhiliangyu-dalgen>mvn mybatis:gen
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building zhiliangyu-dalgen 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- mybatis-maven-plugin:1.12:gen (default-cli) @ zhiliangyu-dalgen ---
输入需要生成的表:
===========输入需要生成的表==============
-- * 标示所有
-- 多表用逗号分隔
-- 新表会先生成默认配置,已有表不会影响修改后的SQL
-- q 退出
===========输入需要生成的表==============

## 这里输入zlyTables下的文件名即可生成mybatis所需文件
test
[info] ==== init connection
- Ignoring: dalgen\BasePage.java.ftl
- Ignoring: dalgen\DAO.java.ftl
- Ignoring: dalgen\DO.java.ftl
- Ignoring: dalgen\DOMapper.java.ftl
- Ignoring: dalgen\Page.java.ftl
- Ignoring: dalgen\ResultMap.java.ftl
- Ignoring: dalgen\XMLMapper.xml.ftl
- Executing: init\initTableXml.ftl
log4j:WARN No appenders could be found for logger (freemarker.cache).
log4j:WARN Please initialize the log4j system properly.
- Ignoring: lib\lib.ftl
[INFO] 初始化表完成
[info] ==== init connection
- Executing: dalgen\BasePage.java.ftl
- Executing: dalgen\DAO.java.ftl
- Executing: dalgen\DO.java.ftl
- Executing: dalgen\DOMapper.java.ftl
- Executing: dalgen\Page.java.ftl
- Executing: dalgen\ResultMap.java.ftl
- Executing: dalgen\XMLMapper.xml.ftl
- Ignoring: init\initTableXml.ftl
- Ignoring: lib\lib.ftl
[INFO] alidalgen 成功生成
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 2.581 s
[INFO] Finished at: 2019-04-25T17:14:43+08:00
[INFO] Final Memory: 19M/221M
[INFO] ------------------------------------------------------------------------
```

所有的业务逻辑sql请写在zlyTables下，src下的文件全由dalgen插件生成。
使用方法请查看config/README.md文件


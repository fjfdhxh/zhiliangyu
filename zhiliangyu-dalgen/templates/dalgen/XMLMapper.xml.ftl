<@pp.dropOutputFile />
<#import "../lib/lib.ftl" as lib/>
<#list dalgen.xmlMappers as xmlMapper>
    <@pp.changeOutputFile name = "/main/resources/${xmlMapper.doMapper.classPath}/${xmlMapper.doMapper.className}.xml" />
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<!--
MIT License

Copyright (c) 2019 guanquan.wang@yandex.com All Rights Reserved.
Copyright (c) 2019 huanghui7635@126.com All Rights Reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->

<mapper namespace="${xmlMapper.doMapper.packageName}.${xmlMapper.doMapper.className}">
    <!-- 自动生成,请修改 ${xmlMapper.table.sqlName}.xml -->
<#--生成BaseResultMap-->
    <resultMap id="BaseResultMap"  type="${xmlMapper.doClass.packageName}.${xmlMapper.doClass.className}">
        <#list xmlMapper.table.columnList as column>
        <#if column.sqlName =="ID"><id column="${column.sqlName}" property="${column.javaName}" jdbcType="${column.sqlType}" javaType="${column.javaType}"/><#else><result column="${column.sqlName}" property="${column.javaName}" jdbcType="${column.sqlType}" javaType="${column.javaType}"/></#if>
        </#list>
    </resultMap>
<#--生成自定义ResultMap-->
<#list xmlMapper.resultMaps as resultMap>

    <!-- ${resultMap.desc!} -->
    <resultMap id="${resultMap.name}" type="${resultMap.packageName}.${resultMap.className}">
<#-- Column -->
    <#list resultMap.columnList as column>
        <#if column.sqlName =="ID" && column.key??><id column="${column.sqlName}" property="${column.javaName}" javaType="${column.javaType}"/><#else><result column="${column.sqlName}" property="${column.javaName}" javaType="${column.javaType}"/></#if>
    </#list>
    <#if resultMap.innerXML??>
    ${resultMap.innerXML!}
    </#if>
    </resultMap>
</#list>

<#-- baseSql -->
    <sql id="Base_Column_List">
        <#list xmlMapper.table.columnList as column><#if column_index gt 0>,</#if>${column.sqlName}</#list>
    </sql>

<#-- sql部分  -->
    <#list xmlMapper.cfTable.operations as operation>

    <#if operation.multiplicity.code=="paging"><#--分页-->
    <#if operation.cdataPageCount??><#--判断是否既有求和语句-->
    <!--${operation.remark!operation.name} pageCount-->
    <${lib.operation2Sql(operation.name)} id="${operation.name}Count"  resultType="int"${lib.timeout(operation)}>
    ${operation.cdataPageCount!}
    </${lib.operation2Sql(operation.name)}>
    </#if>
    <!--${operation.remark!operation.name} pageResult-->
    <${lib.operation2Sql(operation.name)} id="${operation.name}Result"  ${lib.mapperResult(operation)}${lib.timeout(operation)}>
${operation.cdata!}
    limit ${"#"}{limit} offset ${"#"}{startRow}
    </${lib.operation2Sql(operation.name)}>
    <#else><#--非分页-->
    <!--${operation.remark!operation.name}-->
    <${lib.operation2Sql(operation.name)} id="${operation.name}" ${lib.mapperResult(operation)}${lib.timeout(operation)}>
${operation.cdata!}
    </${lib.operation2Sql(operation.name)}>
    </#if>
    </#list>
</mapper>
</#list>

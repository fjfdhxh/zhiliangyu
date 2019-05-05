<@pp.dropOutputFile />
<#list dalgen.daos as dao>
    <@pp.changeOutputFile name = "/main/java/${dao.classPath}/${dao.className}.java" />
/*
 * MIT License
 *
 * Copyright (c) 2019 guanquan.wang@yandex.com All Rights Reserved.
 * Copyright (c) 2019 huanghui7635@126.com All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package ${dao.packageName};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
<#list dao.importLists as import>
import ${import};
</#list>

/**
* The Table ${dao.tableName!}.
* 注意:此结构有系统生成,禁止手工修改,以免被覆盖,请通过dalgen生成
* ${dao.desc!}
*/
@Repository
public class ${dao.className} {

    @Autowired
    private ${dao.doMapper.className} ${dao.doMapper.className?uncap_first};
    <#list dao.methods as method>

    /**
     * ${method.desc!method.name!}.
        <#list  method.params as param>
     * @param ${param.param} ${param.param}
        </#list>
     * @return ${method.returnClass!}
     */
    public ${method.returnClass!} ${method.name}(<#list  method.params as param><#if param_index gt 0>, </#if>${param.paramType!} <#assign pagingParam = param.param/>${param.param}</#list>) {
    <#if method.pagingFlag == "true">
        <#if method.noCount == "true">
        ${pagingParam}.setDatas(${dao.doMapper.className?uncap_first}.${method.name}Result(<#list  method.params as param><#if param_index gt 0>, </#if>${param.param}</#list>));
        // 分页但不求Count，可以提升查询速度。移动端分页不需要知道总共多少页。
        // 直到取得的数据量小于pageSize时表示结束
        ${pagingParam}.setTotal(-1);
        <#else>
        int total = ${dao.doMapper.className?uncap_first}.${method.name}Count(<#list  method.params as param><#if param_index gt 0>, </#if>${param.param}</#list>);
        if (total > 0) {
            ${pagingParam}.setDatas(${dao.doMapper.className?uncap_first}.${method.name}Result(<#list  method.params as param><#if param_index gt 0>, </#if>${param.param}</#list>));
        }
        ${pagingParam}.setTotal(total);
        </#if>
        return ${pagingParam};
    <#else>
        return ${dao.doMapper.className?uncap_first}.${method.name}(<#list  method.params as param><#if param_index gt 0>, </#if>${param.param}</#list>);
    </#if>
    }
    </#list>
}
</#list>

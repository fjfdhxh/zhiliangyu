<@pp.dropOutputFile />
<#list dalgen.doMappers as doMapper>
<@pp.changeOutputFile name = "/main/java/${doMapper.classPath}/${doMapper.className}.java" />
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

package ${doMapper.packageName};

<#list doMapper.importLists as import>
import ${import};
</#list>
<#if doMapper.hasParam>
import org.apache.ibatis.annotations.Param;
</#if>

/**
 * 由于需要对分页支持,请直接使用对应的DAO类
 * 注意:此结构有系统生成,禁止手工修改,以免被覆盖,请通过dalgen生成
 * The Table ${doMapper.tableName!}.
 * ${doMapper.desc!}
 */
public interface ${doMapper.className} {

    <#list doMapper.methods as method>

    /**
     * ${method.desc!method.name!}.
    <#list  method.params as param>
     * @param ${param.param} ${param.param}
    </#list>
     * @return ${method.returnClass!}
     */
    ${method.returnClass!} ${method.name}(<#list  method.params as param><#if param_index gt 0>, </#if><#if param.pAnnot || method.params?size gt 1>@Param("${param.param}")</#if>${param.paramType!} ${param.param}</#list>);
    </#list>
}
</#list>

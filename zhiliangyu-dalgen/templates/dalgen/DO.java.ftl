<@pp.dropOutputFile />
<#list dalgen.dos as DO>
<@pp.changeOutputFile name = "/main/java/${DO.classPath}/${DO.className}.java" />
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

package ${DO.packageName};

<#list DO.importLists as import>
import ${import};
</#list>

/**
 * The table ${DO.desc}
 * 注意:此结构有系统生成,禁止手工修改,以免被覆盖,请通过dalgen生成
 */
public class ${DO.className} {

    <#list DO.fieldsList as fields>

    /**
     * ${fields.name} ${fields.desc}.
     */
    private ${fields.javaType} ${fields.name};
    </#list>
    <#list DO.fieldsList as fields>

    /**
     * Set ${fields.name} ${fields.desc}.
     */
    public void set${fields.name?cap_first}(${fields.javaType} ${fields.name}) {
        this.${fields.name} = ${fields.name};
    }

    /**
     * Get ${fields.name} ${fields.desc}.
     *
     * @return the ${fields.javaType}
     */
    public ${fields.javaType} <#if fields.javaType=='boolean'>is<#else>get</#if>${fields.name?cap_first}() {
        return ${fields.name};
    }
    </#list>
}
</#list>

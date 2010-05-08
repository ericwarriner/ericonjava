

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personInstance}">
            <div class="errors">
                <g:renderErrors bean="${personInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="person.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${personInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userRealName"><g:message code="person.userRealName.label" default="User Real Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'userRealName', 'errors')}">
                                    <g:textField name="userRealName" value="${personInstance?.userRealName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwd"><g:message code="person.passwd.label" default="Passwd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'passwd', 'errors')}">
                                    <g:textField name="passwd" value="${personInstance?.passwd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="person.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${personInstance?.enabled}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailShow"><g:message code="person.emailShow.label" default="Email Show" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'emailShow', 'errors')}">
                                    <g:checkBox name="emailShow" value="${personInstance?.emailShow}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="person.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="person.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${personInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pass"><g:message code="person.pass.label" default="Pass" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'pass', 'errors')}">
                                    <g:textField name="pass" value="${personInstance?.pass}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

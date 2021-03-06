

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.userRealName.label" default="User Real Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "userRealName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.passwd.label" default="Passwd" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "passwd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.enabled}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.authorities.label" default="Authorities" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personInstance.authorities}" var="a">
                                    <li><g:link controller="authority" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.emailShow.label" default="Email Show" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.emailShow}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.pass.label" default="Pass" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "pass")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

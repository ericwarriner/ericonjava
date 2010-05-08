

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'person.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'person.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="userRealName" title="${message(code: 'person.userRealName.label', default: 'User Real Name')}" />
                        
                            <g:sortableColumn property="passwd" title="${message(code: 'person.passwd.label', default: 'Passwd')}" />
                        
                            <g:sortableColumn property="enabled" title="${message(code: 'person.enabled.label', default: 'Enabled')}" />
                        
                            <g:sortableColumn property="emailShow" title="${message(code: 'person.emailShow.label', default: 'Email Show')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "userRealName")}</td>
                        
                            <td>${fieldValue(bean: personInstance, field: "passwd")}</td>
                        
                            <td><g:formatBoolean boolean="${personInstance.enabled}" /></td>
                        
                            <td><g:formatBoolean boolean="${personInstance.emailShow}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

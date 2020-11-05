<%@ page contentType="text/html;charset=UTF-8" language="java" %>
当前第${pageInfo.pageNum}页，总共查找到${pageInfo.total}条数据
<c:if test="${pageInfo.hasPreviousPage}">
    <a href="${pageInfo.url}&pageNum=1&pageSize=${pageInfo.pageSize}">首页</a>
    <a href="${pageInfo.url}&pageNum=${pageInfo.pageNum - 1}&pageSize=${pageInfo.pageSize}">上一页</a>
</c:if>

<c:if test="${not pageInfo.hasPreviousPage}">
    首页
    上一页
</c:if>

<c:if test="${pageInfo.hasNextPage}">
    <a href="${pageInfo.url}&pageNum=${pageInfo.pageNum + 1}&pageSize=${pageInfo.pageSize}">下一页</a>
    <a href="${pageInfo.url}&pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}">尾页</a>
</c:if>

<c:if test="${not pageInfo.hasNextPage}">
    下一页
    尾页
</c:if>

第
<select onchange="location.href='${pageInfo.url}&pageNum=' + this.value + '&pageSize=${pageInfo.pageSize}'">
    <c:forEach var="i" begin="1" end="${pageInfo.pages}">
        <option value="${i}" ${pageInfo.pageNum eq i ? "selected='selected'":""}>${i}</option>
    </c:forEach>
</select>
页

每页
<select onchange="location.href='${pageInfo.url}&pageSize=' + this.value + '&pageSize=${pageInfo.pageSize}'">
    <option value="5" ${pageInfo.pageSize eq 5 ? "selected='selected'":""}>5</option>
    <option value="10" ${pageInfo.pageSize eq 10 ? "selected='selected'":""}>10</option>
    <option value="20" ${pageInfo.pageSize eq 20 ? "selected='selected'":""}>20</option>
    <option value="30" ${pageInfo.pageSize eq 30 ? "selected='selected'":""}>30</option>
    <option value="50" ${pageInfo.pageSize eq 50 ? "selected='selected'":""}>50</option>
    <option value="100" ${pageInfo.pageSize eq 100 ? "selected='selected'":""}>100</option>
</select>
条

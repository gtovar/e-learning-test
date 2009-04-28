function redirectToAddGroup() {
    departmentList = document.getElementById('departmentList');
    location.href = '/Admin/Groups/AddGroup.aspx?DepartmentId=' + departmentList[departmentList.selectedIndex];
}
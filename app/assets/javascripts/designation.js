var department = document.querySelector("#employee_department_id")
var designation = document.querySelector("#employee_designation_id")

		console.log(1)
department.addEventListener('click', function(){
	$.ajax({
		url: `/designation?department=${ department.value }` ,
		type: 'GET',
		// datatype: 'json',
		// success: function(res){
			
		// }


	})
})

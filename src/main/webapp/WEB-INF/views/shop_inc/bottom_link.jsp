<%@ page contentType="text/html;charset=UTF-8"%>


<!--===============================================================================================-->	
	<script src="/resources/funfume/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/funfume/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="/resources/funfume/js/main.js"></script>
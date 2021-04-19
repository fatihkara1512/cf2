    
                <cfprocessingdirective pageEncoding="utf-8">           
</div>

          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-demo.js"></script>
        <script src="js/datatables-demo2.js"></script>
    </body>
</html>
        <script>
           
$(function(){
  $("#kullanicigirisi").click(function(){ 
var kadi=$('#kadi').val();
var sifre=$("#sifre").val();
$.ajax({
url:"included/login/login.cfm", 
data :{ kadi:kadi,sifre:sifre},
success : function(response){
  if(response=="1 "){location.reload();}
  else{alert("Hatalı Giriş!");}
}
});
});
});
</script>
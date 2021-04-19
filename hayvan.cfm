
                         
                               
<cfinclude template="included/layout1.cfm"> 
 <cfif Session.Durum == "True">
                            <main>
                    <div class="container-fluid">
                        <h2 class="mt-4">Canlılar</h2>
                       <br>

                          <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               Canlı Bilgileri
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Sil</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Sil</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                                <cfquery name="x" datasource="alibaba">
                                             SELECT *
                                            FROM hayvan
                                                </cfquery>
                                                <cfloop query="x">
                                                <cfoutput>
                                                <tr id="#x.id#"> 
                                                <td>#x.numara#</td>
                                                <td>#x.tur#</td>
                                                <td>#x.kilo#</td>
                                                <td><i class="fa fa-trash sil" id="#x.id#" style="cursor:pointer;" aria-hidden="true"></i></td>
                                            </tr>
                                            </cfoutput>
                                          </cfloop>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
<div class="table table-bordered">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Canlı Ekle
                            </div><br>
    <div class="col-sm-12">
                <div class="form-group row">
                    <label for="numara" class="col-sm-2 col-form-label">Canlı Numarası</label>
                    <div class="col-sm-10">
                    <input type="text" class="form-control" id="canli" placeholder="Canlı">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="maueyene" class="col-sm-2 col-form-label">Türü</label>
                    <div class="col-sm-10">
                   <select id="tur" class="form-control">
                    <option selected>Keçi</option>
                    <option selected>Koyun</option>
                    <option selected>Köpek</option>
                    <option selected>İnek</option>
                    </select>
                    </div>
                </div>
                    <div class="form-group row">
                    <label for="maueyene" class="col-sm-2 col-form-label">Kilo</label>
                    <div class="col-sm-10">
                 <input type="text" class="form-control" id="kilo" placeholder="Kilo">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-2">
                    <button type="submit" class="btn btn-primary" id="eklemebutonu">Ekle</button>
                    </div>
                      <div class="col-sm-10 alert" id="sonuc"></div>
                </div>
    </div>
  </div>

</div>
                    
 </main>
  </cfif>
<cfinclude template="included/layout2.cfm"> 
<script>




$(function(){
  $("#eklemebutonu").click(function(){ 
      var canli=$("#canli").val();
var tur=$('#tur option:selected').val();
var kilo=$("#kilo").val();
$.ajax({
url:"ekle/hayvan-ekle.cfm", 
data :{ canli:canli,tur:tur,kilo:kilo},
success : function(response){
      var sonuc = response.split(" ");
    if(sonuc[0]=="Başarılı"){ 
$('#dataTable').append('<tr id="'+sonuc[4]+'"><td>'+sonuc[1]+"</td><td>"+sonuc[2]+
"</td><td>"+sonuc[3]+"</td><td>"+'<i class="fa fa-trash sil" id="'+sonuc[4]+
'" style="cursor:pointer;" aria-hidden="true"></i>'+"</td></tr>");
        $("#sonuc").addClass("alert-success");}
        else{ $("#sonuc").addClass("alert-danger");}
    $("#sonuc").html(sonuc[0]);
    $("#sonuc").fadeToggle(3000);
  }
});
});



  $('#dataTable > tbody:last-child').on('click','.sil',function(){
var deletee = $(this).attr("id");
      var onay
onay = confirm("Silmek İstediğinize Emin Misiniz?");
if (onay == true) {
$.ajax({
url:"delete.cfm", 
data :{ tablo:"hayvan",id:$(this).attr("id")},
success : function(response){
    if(response=="Başarılı "){ 
        $("table#dataTable tr#"+deletee).remove();
}

  }
});}

});

});
</script>

<cfinclude template="included/layout1.cfm"> 
 <cfif Session.Durum == "True">
                            <main>
                    <div class="container-fluid">
                        <h2 class="mt-4">Süt</h2>
                       <br>

                          <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Süt Üretimi
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Yem Miktarı (ml)</th>
                                                <th>Tarih</th>
                                                   <th>Sil</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Yem Miktarı (ml)</th>
                                                <th>Tarih</th>
                                                   <th>Sil</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                                <cfquery name="x" datasource="alibaba">
                                             SELECT (sut.id) as sutid,hayvan.numara,hayvan.tur,
                                             hayvan.kilo,(sut.mililitre) as sut,sut.tarih                                         
                                             FROM hayvan
                                             INNER JOIN sut ON hayvan.id = sut.hay_id
                                             ORDER BY sut.id DESC;
                                                </cfquery>
                                                <cfloop query="x">
                                                <cfoutput>
                                                 <tr id="#x.sutid#">
                                                <td>#x.numara#</td>
                                                <td>#x.tur#</td>
                                                <td>#x.kilo#</td>
                                                <td>#x.sut#</td>
                                                <td>#x.tarih#</td>
                                               <td><i class="fa fa-trash sil" id="#x.sutid#" style="cursor:pointer;" aria-hidden="true"></i></td>
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
                                Süt Ekle
                            </div><br>
    <div class="col-sm-12">
    

                <div class="form-group row">
                    <label for="numara" class="col-sm-2 col-form-label">Canlı Numarası</label>
                    <div class="col-sm-10">
                    <input type="text" class="form-control" id="canli" placeholder="Canlı">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="sut" class="col-sm-2 col-form-label">Süt Miktarı</label>
                    <div class="col-sm-10">
                    <input type="sut" class="form-control" id="sut" placeholder="Süt (ml)">
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
var sut=$("#sut").val();
$.ajax({
url:"ekle/sut-ekle.cfm", 
data :{ canli: canli,sut:sut},
success : function(response){
      var sonuc = response.split(" ");
    if(sonuc[0]=="Başarılı"){ 
$('#dataTable').append('<tr id="'+sonuc[5]+'"><td>'+sonuc[1]+"</td><td>"+sonuc[2]+
"</td><td>"+sonuc[3]+"</td><td>"+sonuc[4]+"</td><td>"+sonuc[6]+"</td><td>"+'<i class="fa fa-trash sil" id="'+sonuc[5]+
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
data :{ tablo:"sut",id:$(this).attr("id")},
success : function(response){
    if(response=="Başarılı "){ 
        $("table#dataTable tr#"+deletee).remove();
}

  }
});}

});

});
</script>
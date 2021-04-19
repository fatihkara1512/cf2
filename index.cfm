<cfinclude template="included/layout1.cfm"> 

                            <main>
                    <div class="container-fluid">
                        <h2 class="mt-4">Grafikler</h2>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Genel</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                       Süt Üretimi
                                    </div><br>   <cfchart chartHeight="400" chartWidth="600" showLegend="no">
                                            <cfchartseries type="line" serieslabel="WBC" markerstyle="circle" color="0275D8">
                                            <cfquery name="sut" datasource="alibaba">
                                              SELECT tarih,SUM(mililitre) AS deger From sut GROUP BY tarih
                                                </cfquery>
                                                     <cfloop query="sut">
                                                <cfoutput>
                                                <cfchartdata item="#tarih#" value="#deger#"/>
                                                </cfoutput>
                                                </cfloop>
                                                </cfchartseries>
                                                </cfchart>
                                     
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        Yem Harcamaları
                                    </div><br>
                                    
                                  <cfchart chartHeight="400" chartWidth="600" showLegend="no">
                                            <cfchartseries type="bar" serieslabel="WBC" markerstyle="circle" color="0275D8">
                                            <cfquery name="yem" datasource="alibaba">
                                              SELECT tarih,SUM(miligram) AS deger From yemler GROUP BY tarih
                                                </cfquery>
                                                     <cfloop query="yem">
                                                <cfoutput>
                                                <cfchartdata item="#tarih#" value="#deger#"/>
                                                </cfoutput>
                                                </cfloop>
                                                </cfchartseries>
                                                </cfchart>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Günlük Sütler
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Süt Üretimi (ml)</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Süt Üretimi (ml)</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                                <cfquery name="bugun" datasource="alibaba">
                                             SELECT sut.id,hayvan.numara,hayvan.tur,hayvan.kilo,(sut.mililitre) as sut
                                            FROM hayvan
                                             INNER JOIN sut ON hayvan.id = sut.hay_id
                                             where sut.tarih='<cfscript>
                                                writeOutput(dateformat(now(), "yyyy-mm-dd") & "")
                                                </cfscript>'
                                                order by sut.id desc
                                                </cfquery>
                                                <cfloop query="bugun">
                                                <cfoutput>
                                                <tr> 
                                             

                                                <td>#bugun.numara#</td>
                                                <td>#bugun.tur#</td>
                                                <td>#bugun.kilo#</td>
                                                <td>#bugun.sut#</td>
                                            </tr>
                                            </cfoutput>
                                          </cfloop>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Günlük Yemler
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Yem Miktarı (mg)</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Numara</th>
                                                <th>Tür</th>
                                                <th>Kilo</th>
                                                <th>Yem Miktarı (mg)</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                                <cfquery name="bugun" datasource="alibaba">
                                             SELECT yemler.id,hayvan.numara,hayvan.tur,hayvan.kilo,(yemler.miligram) as yem
                                            FROM hayvan
                                             INNER JOIN yemler ON hayvan.id = yemler.hay_id  
                                             where yemler.tarih='<cfscript>
                                                writeOutput(dateformat(now(), "yyyy-mm-dd") & "")
                                                </cfscript>'
                                               order by yemler.id desc

                                                </cfquery>
                                                <cfloop query="bugun">
                                                <cfoutput>
                                                <tr> 
                                             

                                                <td>#bugun.numara#</td>
                                                <td>#bugun.tur#</td>
                                                <td>#bugun.kilo#</td>
                                                <td>#bugun.yem#  </td>
                                            </tr>
                                            </cfoutput>
                                          </cfloop>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
 </main>
<cfinclude template="included/layout2.cfm"> 

  // Call the dataTables jQuery plugin
$(document).ready(function() {
    $('#dataTable1').DataTable({
        language: {
            info: "Kayıtlar",
            infoEmpty:      "Gösterilecek hiç kayıt yok.",
            loadingRecords: "Kayıtlar yükleniyor.",
            lengthMenu: "Sayfada _MENU_ kayıt göster",
            zeroRecords: "-",
            search: "Arama:",
            infoFiltered:   "(toplam _MAX_ kayıttan filtrelenenler)",
            paginate: {
                first: "İlk",
                previous: "Önceki",
                next: "Sonraki",
                last: "Son"
            }
        }
    });
  });
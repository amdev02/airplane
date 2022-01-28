class BaseUrl {
  // url
  static String url = "https://marketingbranding.id/api/varana/";
  static String urlNotif =
      "https://marketingbranding.id/api/varana/notification/";
  static String imageUrl =
      "https://marketingbranding.id/api/varana/imagesProfile/";
  static String absenUrl =
      "https://marketingbranding.id/api/varana/imagesAbsen/";

  // signin
  static String signIn = "$url/signIn.php";

  // bank
  static String getBank = "$url/getBank.php";

  // tracking
  static String getTrackingWhere = "$url/getTrackingWhere.php";
  static String addTracking = "$url/addTracking.php";

  //notification
  static String notifLead = "$urlNotif/notifLead.php";
  static String notifFollowUp = "$urlNotif/notifFollowUp.php";
  static String notifVisit = "$urlNotif/notifVisit.php";
  static String notifSudahDatang = "$urlNotif/notifSudahDatang.php";
  static String notifReservasi = "$urlNotif/notifReservasi.php";
  static String notifBooking = "$urlNotif/notifBooking.php";
  static String notifSold = "$urlNotif/notifSold.php";
  static String notifAbsen = "$urlNotif/notifAbsen.php";
  static String notifPamit = "$urlNotif/notifPamit.php";

  // Absen
  static String addAbsen = "$url/addAbsen.php";
  static String getAbsenToday = "$url/getAbsenToday.php";
  static String getAbsen = "$url/getAbsen.php";

  // change
  static String changeName = "$url/changeName.php";
  static String changeUsername = "$url/changeUsername.php";
  static String changeImage = "$url/changeImage.php";
  static String changePassword = "$url/changePassword.php";
  static String changeToken = "$url/changeToken.php";

  // List Tamu
  static String addListTamu = "$url/addListTamu.php";
  static String getListTamuByMarkom = "$url/getListTamuByMarkom.php";
  static String deleteListTamu = "$url/deleteListTamu.php";
  static String getListTamuAll = "$url/getListTamuAll.php";
  static String getListTamuByCreate = "$url/getListTamuByCreate.php";

  //user
  static String getUser = "$url/getUserById.php";
  static String addUser = "$url/addUser.php";
  static String deleteUser = "$url/deleteUser.php";
  static String activeUser = "$url/activeUser.php";
  static String deactiveUser = "$url/deactiveUser.php";
  static String getUserByMarkom = "$url/getUserByMarkom.php";
  static String getUserByLevel = "$url/getUserByLevel.php";
  static String getAntrianByMarkom = '$url/getAntrian.php';
  static String getAntrianAll = '$url/getAntrianAll.php';
  static String getAmbilLead = '$url/ambilLead.php';
  static String getPendingAll = '$url/getPendingAll.php';

  // insight
  static String getInsightAllDaily = "$url/insightAllDaily.php";
  static String getInsightAllWeekly = "$url/insightAllWeekly.php";
  static String getInsightAllMonthly = "$url/insightAllMonthly.php";
  static String getInsightDailyByMarkom = "$url/insightDailyByMarkom.php";
  static String getInsightWeeklyByMarkom = "$url/insightWeeklyByMarkom.php";
  static String getInsightMonthlyByMarkom = "$url/insightMonthlyByMarkom.php";
  static String getInsightDailyBySales = "$url/insightDailyBySales.php";
  static String getInsightWeeklyBySales = "$url/insightWeeklyBySales.php";
  static String getInsightMonthlyBySales = "$url/insightMonthlyBySales.php";

  // owner
  static String getOmset = "$url/getOmset.php";

  // Master Stock
  static String getProject = "$url/getProject.php";

  // home
  static String addHome = "$url/addHome.php";
  static String deleteHome = "$url/deleteHome.php";
  static String getHomeAll = "$url/getHomeAll.php";
  static String getHomeByStatus = "$url/getHomeByStatus.php";
  static String editHomeStatus = "$url/editHomeStatus.php";

  // count
  static String countLead = "$url/countLead.php";
  static String countMarkom = "$url/countMarkom.php";
  static String countSales = "$url/countSales.php";
  static String countHome = "$url/countHome.php";

  // fee
  static String getFee = '$url/getFee.php';

  // lead
  static String addLead = "$url/addLead.php";
  static String addLeadFromSales = "$url/addLeadFromSales.php";
  static String editLead = "$url/editLead.php";
  static String deleteLead = "$url/deleteLead.php";
  static String addFollowUp = "$url/addFollowUp.php";
  static String addVisit = "$url/addVisit.php";
  static String rescheduleVisit = "$url/rescheduleVisit.php";
  static String addVisitConfirmed = "$url/addVisitConfirmed.php";
  static String addReservasi = "$url/addReservasi.php";
  static String addBooking = "$url/addBooking.php";
  static String addSold = "$url/addSold.php";
  static String getLeadAll = "$url/getLeadAll.php";
  static String getFollowUpAll = "$url/getFollowUpAll.php";
  static String getVisitAll = "$url/getVisitAll.php";
  static String getReservasiAll = "$url/getReservasiAll.php";
  static String getBookingAll = "$url/getBookingAll.php";
  static String getSoldAll = "$url/getSoldAll.php";
  static String getSoldLimit3 = "$url/getSoldLimit3.php";

  // payment
  static String getPayment = "$url/getPayment.php";

  // markom
  static String getLeadByMarkom = "$url/getLeadByMarkom.php";
  static String getFollowUpByMarkom = "$url/getFollowUpByMarkom.php";
  static String getVisitByMarkom = "$url/getVisitByMarkom.php";
  static String getReservasiByMarkom = "$url/getReservasiByMarkom.php";
  static String getBookingByMarkom = "$url/getBookingByMarkom.php";
  static String getSoldByMarkom = "$url/getSoldByMarkom.php";
  static String getPendingMarkom = "$url/getPendingMarkom.php";

  // sales
  static String getLeadBySales = "$url/getLeadBySales.php";
  static String getFollowUpSales = "$url/getFollowUpSales.php";
  static String getVisitBySales = "$url/getVisitBySales.php";
  static String getReservasiBySales = "$url/getReservasiBySales.php";
  static String getBookingBySales = "$url/getBookingBySales.php";
  static String getSoldBySales = "$url/getSoldBySales.php";
  static String getPendingSales = "$url/getPendingSales.php";

  // lama
  static String countRumah = "$url/countRumah.php";
  static String countProject = "$url/countProject.php";
  static String getUnitAvailable = "$url/stockAvailable.php";
  static String getUnitReservsai = "$url/tampilRumahReservasi.php";
  static String getUnitBooking = "$url/tampilRumahBooking.php";
  static String getUnitSold = "$url/tampilRumahSold.php";
  static String getSalesPending = "$url/getPendingSales.php";
  static String getLeadSales = "$url/tampilLeadSales.php";
  static String getReservasiSales = "$url/tampilReservasi.php";
  static String getBookingSales = "$url/tampilBooking.php";
  static String getFeeDetail = "$url/feeDetailLead.php";
  static String getRumahDetail = "$url/rumahDetailLead.php";
  static String getPembayaranDetail = "$url/pembayaranDetail.php";
  static String getSoldKpr = "$url/soldKPR.php";
  static String getCashBertahap = "$url/soldCashBertahap.php";
  static String getCashKeras = "$url/soldCashKeras.php";
  static String getAkanVisit = "$url/tampilAkanVisit.php";
  static String getSudahVisit = "$url/tampilSudahDatang.php";
  static String getBankDetail = "$url/bankDetailLead.php";
  static String getLeadMarkom = "$url/tampilLeadMarkom.php";
  static String getFollowUpMarkom = "$url/tampilFollowUpMarkom.php";
  static String getReservasiMarkom = "$url/tampilReservasiMarkom.php";
  static String getBookingMarkom = "$url/tampilBookingMarkom.php";
  static String getSoldCashBertahanMarkom = "$url/soldCashBertahapMarkom.php";
  static String getSoldCashKerasMarkom = "$url/soldCashKerasMarkom.php";
  static String getKprMarkom = "$url/soldKPRMarkom.php";
  static String getAkanVisitMarkom = "$url/tampilAkanVisitMarkom.php";
  static String getSudahVisitMarkom = "$url/tampilSudahVisitMarkom.php";
  static String getAkanVisitOwner = "$url/tampilAkanVisitOwner.php";
  static String getSudahVisitOwner = "$url/tampilSudahVisitOwner.php";
  static String getReservasiOwner = "$url/tampilReservasiOwner.php";
  static String getBookingOwner = "$url/tampilBookingOwner.php";
  static String getSoldCashBertahapOwner = "$url/soldCashBertahapOwner.php";
  static String getSoldCashKerasOwner = "$url/soldCashKerasOwner.php";
  static String getKprOwner = "$url/soldKPROwner.php";
  static String getInsightHarian = "$url/insightHari.php";
  static String getInsightMingguan = "$url/insightMinggu.php";
  static String getInsightBulanan = "$url/insightBulan.php";
  static String getInsightHarianMarkom = "$url/insightHarianMarkom.php";
  static String getInsightBulananMarkom = "$url/insightBulananMarkom.php";
  static String getInsightMingguanMarkom = "$url/insightMingguanMarkom.php";
  static String getInsightHarianSales = "$url/insightHarianSales.php";
  static String getInsightBulananSales = "$url/insightBulananSales.php";
  static String getInsightMingguanSales = "$url/insightMingguanSales.php";
  static String getSales = "$url/getSales.php";
  static String addNewLead = "$url/addNewLead.php";
  static String addLeadTimeOut = "$url/addLeadTimeOut.php";
  static String ambilLead = "$url/ambilLead.php";
  static String tambahFollowUp = "$url/tambahFollowUp.php";
  static String tambahVisit = "$url/tambahVisit.php";
  static String selectedRumah = "$url/selectedRumah.php";
  static String tambahReservasi = "$url/tambahReservasi.php";
  static String reschedule = "$url/ReScheduleVisit.php";
  static String tambahSudahDatang = "$url/tambahSudahDatang.php";
  static String tambahBooking = "$url/tambahBooking.php";
  static String selectedBank = "$url/selectedBank.php";
  static String tambahSold = "$url/tambahSold.php";
  static String getTracking = "$url/getTracking.php";
  static String addAbsensi = "$url/tambahAbsensi.php";
  static String tampilAbsensiSales = "$url/tampilAbsenSales.php";
  static String tampilAbsensiSalesAll = "$url/tampilAbsenSalesAll.php";
  static String tampilAbsensi = "$url/tampilAbsen.php";
  static String tampilAbsensiAll = "$url/tampilAbsenAll.php";
  static String getPendingHm = "$url/getPendingHeadMarkom.php";
  static String getLeadHm = "$url/tampilLeadHm.php";
  static String getMarkom = "$url/tampilMarkom.php";
  static String addMarkom = "$url/tambahMarkom.php";
  static String deleteUsers = "$url/deleteUsers.php";
  static String getHeadMarkom = "$url/tampilHeadMarkom.php";
  static String addHeadMarkom = "$url/tambahHeadMarkom.php";
  static String getSpv = "$url/tampilSpv.php";
  static String addSpv = "$url/tambahSpv.php";
  static String getOwner = "$url/tampilOwner.php";
  static String addOwner = "$url/tambahOwner.php";
  static String getUserSales = "$url/tampilSales.php";
  static String addSales = "$url/tambahSales.php";
  static String tambahRumah = "$url/tambahRumah.php";
  static String tambahAvailable = "$url/tambahAvailable.php";
  static String active = "$url/active.php";
  static String activeNon = "$url/activeNon.php";
  static String antrian = "$url/antrian.php";
  static String reportLead = "$url/reportLeadPertanggal.php";

  static String count = "$url/count.php";
  static String sold3 = "$url/sold3.php";
  static String omset = "$url/omset.php";
  static String tampilFollowUpHm = "$url/tampilFollowUpHm.php";
  static String getUserInsight = "$url/getUserInsight.php";
}

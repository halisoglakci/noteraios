class ApiConfig {
  static const String baseUrl = 'http://10.0.2.2:5000/api';
}
























/*
class ApiConfig {             -> API ile ilgili yapılandırma değerlerini bir yerde toplamak için kendi sınıfımızı oluşturuyoruz. İleride farklı dosyalarda API adresine ihtiyacımız olduğunda 'http://10.0.2.2:5000/api' yazmak yerine 'ApiConfig.baseUrl' diyeceğiz.
Örneğin ilerde: final url = "'${ApiConfig.baseUrl}/songs;'" ifadesi yerine "http://10.0.2.2:5000/api/songs" diyeceğiz.

"static const String baseUrl" Nedir?
String : Tuttuğumuz veri metin
baseUrl: Değişkenimizin adı. 'Base URL', yani API'nin temel adresi
const  : Bu değer uygulama çalışırken değişmeyecek
static : ApiConfig nesnesi oluşturmadan doğrudan sınıf üzerinden erişmemizi sağlıyor. Yani "final config = ApiConfig();" yapmak yerine  "ApiConfig.baseUrl" yapabiliyoruz.

"http://10.0.2.2:5000/api" ifadesinde 10.0.2.2 kullanıp localhost kullanmamamızın nedeni: backend bilgisayarımızda 5000 portunda çalışıyorsa Flutter tarafından adres "http://10.0.2.2:5000/api" şeklinde olmalıdır. Çünkü Android emülatörünün içindeki localhost, bizim Windows bilgisayarımızı değil, emülatörün kendisini ifade eder. Android Emulator'dan bilgisayarımıza ulaşmak için genellikle 10.0.2.2 kullanıyoruz.
5000 şu anda kesinleşmiş gerçek backend portumuz değil; örnek olarak kullanıyoruz. ASP.NET Core API'yi gerçekten ayağa kaldırdığımızda bize verilen port neyse baseUrl değerini ona göre güncelleyeceğiz.
*/

import 'dart:convert';

class PlacesModel {
  var dataSource = '''
  [
    { 
      "title": "วัดพระแก้ว",
      "imagePath": "assets/place-01.jpg",
      "openTime": "08.00-18.00",
      "reviewStar": "4.6",
      "description": "วัดพระศรีรัตนศาสดาราม หรือที่เรียกกันทั่วไปว่า วัดพระแก้ว เป็นวัดที่พระบาทสมเด็จพระพุทธยอดฟ้าจุฬาโลกมหาราชโปรดเกล้าฯ ให้สร้างขึ้นใน พ.ศ. 2325 เป็นวัดในพระบรมมหาราชวังเช่นเดียวกับวัดพระศรีสรรเพชญ์ ซึ่งเป็นวัดในพระราชวังหลวงในสมัยอยุธยา และมีพระราชประสงค์ให้วัดพระศรีรัตนศาสดารามเป็นที่ประดิษฐาน พระพุทธมหามณีรัตนปฏิมากร หรือพระแก้วมรกต พระคู่บ้านคู่เมืองของแผ่นดินสยามที่พบ ณ วัดป่าเยี้ยะ (ป่าไผ่) จังหวัดเชียงราย และเป็นสถานที่ทรงบำเพ็ญพระราชกุศล วัดพระศรีรัตนศาสดารามเป็นวัดที่ไม่มีพระสงฆ์จำพรรษาอยู่ เพราะมีแต่ส่วนพุทธาวาสไม่มีส่วนสังฆาวาส"
    },
    { 
      "title": "ไอคอนสยาม",
      "imagePath": "assets/place-02.jpg",
      "openTime": "10.00-22.00",
      "reviewStar": "4.8",
      "description": "ไอคอนสยาม (อังกฤษ: ICONSIAM) เป็นโครงการพัฒนาพื้นที่เชิงพาณิชยกรรมแบบผสมริมแม่น้ำเจ้าพระยา ซึ่งเป็นความร่วมมือระหว่าง สยามพิวรรธน์ เครือเจริญโภคภัณฑ์ และ แมกโนเลีย ควอลิตี้ ดิเวล็อปเม้นต์ คอร์ปอเรชั่น เป็นโครงการที่ใช้เงินลงทุนสูงที่สุดในประวัติศาสตร์การลงทุนด้านอสังหาริมทรัพย์ประเทศไทยเมืองช่วงเปิดตัว มีพิธีเปิดโครงการในวันที่ 9 พฤศจิกายน พ.ศ. 2561 และเริ่มเปิดให้บริการแก่ประชาชนทั่วไปในวันถัดมา โดยตัวโครงการประกอบด้วยอาคารศูนย์การค้าสองอาคาร และอาคารชุดเพื่อการพักอาศัยอีกสองอาคาร ซึ่งหนึ่งในนั้นเป็นอาคารที่สูงที่สุดในประเทศไทย"
    },
    { 
      "title": "ตลาดน้ำขวัญเรียม",
      "imagePath": "assets/place-03.jpg",
      "openTime": "เฉพาะ ส-อา 07.00-18.00",
      "reviewStar": "4.2",
      "description": "ตลาดน้ำใจกลางกรุง ริมคลองแสนแสบเชื่อมสองฝั่งคลอง วัดบำเพ็ญเหนือเสรีไทย 60 -วัดบางเพ็งใต้รามคำแหง 185 ด้วยสะพานเรือแห่งเดียวในโลก พร้อมด้วยกองเรือโบราณ อายุนับ 100 ปี มีกิจกรรมต่างๆ มากมาย ทั้งการตักบาตรพระทางเรือ การแสดงศิลปะวัฒนธรรม และงานประเพณีทางน้ำ ฯลฯ  พร้อมเลือกชิมอาหารอร่อย และสินค้าคุณภาพ OTOP เลือกซื้อเป็นของฝากติดไม้ติดมือกลับไปฝากผู้เป็นที่รัก"
    },
    { 
      "title": "ตลาดนัดรถไฟ",
      "imagePath": "assets/place-04.jpg",
      "openTime": "18.00-02.00",
      "reviewStar": "4.4",
      "description": "ตลาดนัดรถไฟรัชดา (Train Night Market Ratchada) เป็นตลาดนัดในเครือตลาดนัดรถไฟศรีนครินทร์ ตลาดนัดกลางคืน เปิดอยู่ที่ด้านหลังห้างเอสพลานาด รัชดาภิเษก โดยถ้ามองจากมุมสูงของตลาดนัดรถไฟรัชดาจะเห็นว่าตลาดนี้มีพื้นที่ขายของจำนวนมาก มีพื้นที่กว่าพันล็อกให้เช่า คนที่มากันส่วนมากจะเป็นชาวต่างชาติ วัยรุ่น และคู่รัก มากกว่าผู้ใหญ่ หรือมากันเป็นครอบครัว"
    },
    { 
      "title": "ท้องฟ้าจำลอง",
      "imagePath": "assets/place-05.jpg",
      "openTime": "09.00-16.30 ปิดวันจันทร์",
      "reviewStar": "4.3",
      "description": "ท้องฟ้าจำลองกรุงเทพเอกมัย ได้มีบทบาทในการสร้างแรงบันดาลใจให้แก่เยาวชนไทยจนเติบโตขึ้นมาเป็นนักวิทยาศาสตร์จนนับไม่ถ้วนแล้ว ตั้งแต่ปี 2507 เป็นต้นมา ซึ่งด้วยจุดเด่นที่เป็นห้องฉายดาวรูปโดมพิเศษ ที่สร้างความตื่นตาตื่นใจได้ไม่น้อยหลังจากทำงานอย่างหนัก 50 ปี เครื่องฉายดาวกลไกโบราณแบบเก่า ก็ได้เวลาพักผ่อน และถูกแทนที่ด้วยเครื่องฉายแบบดิจจิตอลความละเอียดสูง 4K โฉมใหม่ที่จะให้ทำให้ท้องฟ้าจำลองนี้ไม่เหมือนเดิมอีกต่อไป"
    }
  ]
  ''';

  Object getData() {
    var data = json.decode(dataSource);
    return data;
  }

  Map getDataByTitle(String title) {
    List<Object> dataSources = json.decode(dataSource);
    for(Map data in dataSources) {
      if( data['title'] == title) {
        return data;
      }
    }
    return null;
  }
}
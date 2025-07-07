import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Drag Handle
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Header
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "2hr ago",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.radio, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      const Text(
                        "Ethio FM",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/soundwave.png", height: 30),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.pause_circle_filled,
                        size: 28,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // News Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/taa.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    const Text(
                      "በጋምቤላ ክልል በግንባታ ማእድን ላይ የተጋነነ የዋጋ ጭማሪ እየታየ ነዉ ተባለ ።",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Body Text
                    const Text(
                      """የግንባታ ማእድናቱን የዋጋ ተመን ማስተካከያ እየተደረገበት መሆኑንም ሰምተናል።
    ከ2015 አመት ጀምሮ በጋምቤላ ክልል ሁሉም ወረዳዎች ላይ የግንባታ ማእድናት ከፍተኛ ዋጋ እየተጠየቀባቸዉ ነዉ ተብሏል።
    
    ለዋጋ ጭማሪዉ ምክንያት ሆኗል የተባለዉ የነዳጅ ዋጋ መጨመር እንደሆነ የክልሉ የማእድን ሀብት ልማት ቢሮ ገልፆል።
    
    በቢሮዉ ሀላፊ የሆኑት አቶ ኡጅሉ ጊሎ ይህንን የማእድናቱ የተጋነነ የዋጋ ጭማሪ ተከትሎ አቤቱታ መቅረቡን ገልፀዋል።
    
    የዋጋ ንረቱን ለመቆጣጠር እንዲቻል ጥረት እየተደረገ ነዉ ÷ በተጋነነ ዋጋ ሲሸጥ የነበረዉን የማእድናቱን ዋጋ ማስተካከያ አድርገናል ብለዋል ሀላፊዉ። በዚህም በኬላዎች ይጣል የነበረዉን የቀረጥ እና ኮቴ ዋጋ ማስተካከያ እንደተደረገ ቢሮዉ ማሳወቁን ከክልሉ የተገኘዉ መረጃ አመላክቷል። ምክንያታዊ ያልሆነ የዋጋ ጭማሪ እንዳይኖር እና ማስተካከያ በተደረገበት የዋጋ ተመን እንዲሸጥ ማሳሰቢያ መሰጠቱን ገልፆል።
    
    ቢሮዉ የዋጋ ማሻሻያዉ ያደረኩት ይመለከታቸዋል ከተባሉ የባለድርሻ አካላት ጋር ባደረጉት ንግግር ነዉ ብሏል።
    
    ቁምነገር አየለ
    ሚያዚያ 7 ቀን 2017 ዓ.ም""",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Footer: Likes, Comments, Share
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                children: [
                  // Interaction Buttons
                  Row(
                    children: [
                      const Text("400", style: TextStyle(fontSize: 13)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(width: 16),
                      const Text("400", style: TextStyle(fontSize: 13)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(width: 16),
                      const Text("4", style: TextStyle(fontSize: 13)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Comment Field
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      hintText: "Write a comment...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

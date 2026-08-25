# 💬 Chat App (Flutter & Firebase)

تطبيق محادثة فورية (Chat Application) يتيح للمستخدمين التواصل وتبادل الرسائل، مدمج مع **Firebase** لإدارة الخدمات الخلفية والبيانات الفورية.

---

## 📁 هيكلية المشروع (Project Structure)

```text
lib/
├── pages/                  # شاشات التطبيق الرئيسية (Login, Register, Chat UI)
├── constant/               # الثوابت مثل الألوان والأشياء المكررة (App Constants)
├── customWidget/           # العناصر البرمجية المخصصة (Custom Buttons, Inputs, Bubble Messages)
├── fetchData/              # منطق واستدعاء البيانات (Firebase Queries & Data Fetching)
├── model/                  # نماذج البيانات (Message & User Models)
├── firebase_options.dart   # إعدادات وتكينات Firebase لكل منصة
└── main.dart               # نقطة انطلاق التطبيق الرئيسية

التقنيات والمكتبات (Tech Stack)
Framework: Flutter
Language: Dart
Backend & Database: Firebase (Cloud Firestore / Firebase Auth)

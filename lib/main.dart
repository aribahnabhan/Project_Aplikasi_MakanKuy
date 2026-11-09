import 'package:flutter/material.dart';

void main() {
  runApp(const MakanKuyApp());
}

class MakanKuyApp extends StatelessWidget {
  const MakanKuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MakanKuy',
      theme: ThemeData(useMaterial3: true),
      home: const ScreenLock(),
    );
  }
}

// ==========================================
// HALAMAN 1: SCREEN LOCK
// ==========================================

class ScreenLock extends StatelessWidget {
  const ScreenLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF00C9B7), Color(0xFF00A99D), Color(0xFF008F83)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MakanKuy',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 75),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'BINGUNG MAU MAKAN?\nTENANG ADA KITA!',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 100),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white70, width: 1.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),

                    // PINDAH KE HALAMAN LOGIN
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },

                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 29,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// HALAMAN 2: LOGIN
// ==========================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // BACKGROUND FOTO MAKANAN
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/register_bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          // Lapisan gelap supaya tulisan terlihat
          color: Colors.black.withValues(alpha: 0.40),

          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),

                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // TOMBOL REGISTER DAN LOGIN
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00BFA5),
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: const Text('Register'),
                            ),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF00A99D),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 290),

                    // LOGO MAKANKUY
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'Georgia', fontSize: 45),
                        children: [
                          TextSpan(
                            text: 'Makan',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Kuy',
                            style: TextStyle(color: Color(0xFF00E5CC)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INPUT EMAIL
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Georgia',
                            fontSize: 25,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Color(0xFF00E5CC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    // INPUT PASSWORD
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Georgia',
                            fontSize: 25,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 20,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white70,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Color(0xFF00E5CC),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // LUPA PASSWORD
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45, top: 12),
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Fitur lupa password belum tersedia.',
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'LUPA PASSWORD?',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // TOMBOL MASUK
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: OutlinedButton(
                          onPressed: () {
                            if (emailController.text.trim().isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Email dan password harus diisi!',
                                  ),
                                ),
                              );
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Login belum terhubung ke sistem autentikasi.',
                                ),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Georgia',
                              fontSize: 27,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // DAFTAR AKUN
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Daftar Akun',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// HALAMAN REGISTER SEMENTARA
// ==========================================

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun'),
        backgroundColor: const Color(0xFF00A99D),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Halaman Registrasi MakanKuy',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

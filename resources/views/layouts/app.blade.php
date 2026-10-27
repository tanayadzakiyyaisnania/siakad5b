<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield('title', 'SIAKAD') | {{ config('app.name') }}</title>

    <!-- Bootstrap CSS -->
    <link href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="{{ asset('vendor/bootstrap-icons/bootstrap-icons.min.css') }}"
          rel="stylesheet">

    <!-- CSS SIAKAD -->
    <link href="{{ asset('css/siakad.css') }}" rel="stylesheet">

    @stack('styles')
</head>

<body class="bg-body-tertiary">

    <!-- Navbar -->
    @include('layouts.partials.navbar')

    <!-- Konten Utama -->
    <div class="container-fluid">
        <div class="row">

            <!-- Sidebar -->
            @include('layouts.partials.sidebar')

            <!-- Halaman -->
            <main class="col-lg-9 col-xl-10 px-3 px-md-4 py-4">
                @yield('content')

                <!-- Footer -->
                <footer class="text-center text-body-secondary small mt-5">
                    &copy; {{ date('Y') }} {{ config('app.name') }}
                    - D3 Teknik Informatika
                </footer>
            </main>

        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}">
    </script>

    <script>
        const tombolTema = document.getElementById('themeToggle');
        const ikonTema = document.getElementById('themeIcon');

        if (tombolTema) {
            tombolTema.addEventListener('click', function () {
                const html = document.documentElement;

                if (html.getAttribute('data-bs-theme') === 'dark') {
                    html.setAttribute('data-bs-theme', 'light');
                    ikonTema.className = 'bi bi-moon-fill';
                } else {
                    html.setAttribute('data-bs-theme', 'dark');
                    ikonTema.className = 'bi bi-sun-fill';
                }
            });
        }
    </script>
    @stack('scripts')
</body>
</html>
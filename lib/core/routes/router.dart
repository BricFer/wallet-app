import 'package:go_router/go_router.dart';
import 'package:wallet_app/core/providers/auth_provider.dart';
import 'package:wallet_app/screens/screens.dart';
import 'package:wallet_app/screens/sign_up_details.dart';

const _publicRoutes = {'/login', '/sign-up', '/reset-password'};

GoRouter buildRouter(AuthProvider authProvider) {
  return GoRouter(
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggedIn = authProvider.firebaseUser != null;
      final hasProfile = authProvider.hasBackendProfile;
      final isPublicRoute = _publicRoutes.contains(state.matchedLocation);
      final isCompleteProfileRoute =
          state.matchedLocation == '/sign-up-details';

      if (!isLoggedIn) {
        return isPublicRoute ? null : '/login';
      }
      if (isLoggedIn && hasProfile == false && !isCompleteProfileRoute) {
        return '/sign-up-details';
      }
      if (isLoggedIn &&
          hasProfile == true &&
          (isCompleteProfileRoute || isPublicRoute)) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(path: "/dashboard", builder: (_, __) => const AppShell()),
      GoRoute(path: "/about-us", builder: (_, __) => const AboutUsScreen()),
      GoRoute(
        path: "/account-access",
        builder: (_, __) => const AccountAccessScreen(),
      ),
      GoRoute(
        path: "/add-expense",
        builder: (_, __) => const AddEditExpenseScreen(),
      ),
      GoRoute(
        path: "/edit-expense",
        builder: (_, __) => const AddEditExpenseScreen(),
      ),
      GoRoute(
        path: "/add-income",
        builder: (_, __) => const AddEditIncomeScreen(),
      ),
      GoRoute(
        path: "/edit-income",
        builder: (_, __) => const AddEditIncomeScreen(),
      ),
      GoRoute(path: "/currency", builder: (_, __) => const CurrencyScreen()),
      GoRoute(
        path: "/edit-profile",
        builder: (_, __) => const EditProfileScreen(),
      ),
      GoRoute(
        path: "/information",
        builder: (_, __) => const InformationScreen(),
      ),
      GoRoute(path: "/login", builder: (_, __) => const LoginScreen()),
      GoRoute(
        path: "/personal-info",
        builder: (_, __) => const PersonalInfoScreen(),
      ),
      GoRoute(path: "/profile", builder: (_, __) => const ProfileScreen()),
      GoRoute(
        path: "/reset-password",
        builder: (_, __) => const ResetPasswordScreen(),
      ),
      GoRoute(path: "/settings", builder: (_, __) => const SettingsScreen()),
      GoRoute(path: "/sign-up", builder: (_, __) => const SignUpScreen()),
      GoRoute(
        path: "/sign-up-details",
        builder: (_, __) => const SignUpDetailsScreen(),
      ),
      GoRoute(path: "/transactions", builder: (_, __) => TransactionsScreen()),
    ],
  );
}

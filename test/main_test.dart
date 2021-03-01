import 'src/google_my_business_test.dart' as gmbApiTest;
import 'src/managers/locations_manager_test.dart' as locationsManagerTest;
import 'src/managers/reviews_manager_test.dart' as reviewsManagerTest;

void main() {
  // Main
  gmbApiTest.main();

  // Managers
  locationsManagerTest.main();
  reviewsManagerTest.main();
}

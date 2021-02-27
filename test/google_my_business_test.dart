import 'gmb_api_test.dart' as gmbApiTest;
import 'managers/locations_manager_test.dart' as locationsManagerTest;
import 'managers/reviews_manager_test.dart' as reviewsManagerTest;

void main() {
  // Main
  gmbApiTest.main();

  // Managers
  locationsManagerTest.main();
  reviewsManagerTest.main();
}

import 'package:test/test.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';

void main() {
  group('ElementState', () {
    test('should create an instance with given title and position', () {
      final state = ElementState(title: 'Test Element', position: (10.0, 20.0));
      expect(state.title, 'Test Element');
      expect(state.position, (10.0, 20.0));
    });
  });
}
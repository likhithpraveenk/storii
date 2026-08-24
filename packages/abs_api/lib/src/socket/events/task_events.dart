import 'package:abs_api/src/models/models.dart';
import 'package:abs_api/src/socket/events/socket_events.dart';

class TaskEvents extends SocketEvents {
  new(super.socket);

  Stream<Task> _onScanEvent(String event) =>
      onJson('task_$event', (json) => fromJson(json, Task.fromJson));

  Stream<Task> get onTaskStart => _onScanEvent('started');

  Stream<Task> get onTaskUpdate => _onScanEvent('updated');

  Stream<Task> get onTaskComplete => _onScanEvent('finished');
}

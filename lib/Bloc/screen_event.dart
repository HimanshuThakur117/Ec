// Events
abstract class DataEvent {}

class FetchDataEvent extends DataEvent {
}
class FetchDataEventForPreviewPage extends DataEvent {
}
class FetchDataEventForUserDetails extends DataEvent {
}
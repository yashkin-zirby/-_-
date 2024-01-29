import 'package:laba3/messenger.dart';
import 'package:laba3/printer.dart';

class VKMessenger extends Messenger with Printer implements Comparable, Iterator, Iterable{
  List<String> _messages = [];
  @override
  List<String> get messages => _messages;
  @override
  set messages(value) => _messages = value;
  VKMessenger(String welcomeMessage){
    _messages = [welcomeMessage];
  }
  VKMessenger.defaultWelcome(){
    _messages = ["Welcome to vk chat"];
  }
  @override
  String readChat() {
    return _messages.join('\n');
  }
  @override
  void sendMessage(String username, String message) {
    _messages.add("vk.com:$username:> $message");
  }

  @override
  bool any(bool Function(dynamic element) test) {
    return messages.any(test);
  }

  @override
  Iterable<R> cast<R>() {
    return messages.cast<R>();
  }

  @override
  int compareTo(other) {
    return hashCode - other.hashCode;
  }

  @override
  bool contains(Object? element) {
    return messages.contains(element);
  }

  int _currentIndex = 0;
  @override
  get current => messages[_currentIndex];

  @override
  elementAt(int index) {
    return messages.elementAt(index);
  }

  @override
  bool every(bool Function(dynamic element) test) {
    return messages.every(test);
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(dynamic element) toElements) {
    return messages.expand(toElements);
  }

  @override
  get first => messages.first;

  @override
  firstWhere(bool Function(dynamic element) test, {Function()? orElse}) {
    if(orElse != null) return messages.firstWhere(test,orElse: ()=>orElse());
    return messages.firstWhere(test);
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, dynamic element) combine) {
    return messages.fold(initialValue, combine);
  }

  @override
  Iterable followedBy(Iterable other) {
    return messages.cast().followedBy(other);
  }

  @override
  void forEach(void Function(dynamic element) action) {
    messages.forEach(action);
  }

  @override
  bool get isEmpty => messages.isEmpty;

  @override
  bool get isNotEmpty => messages.isNotEmpty;

  @override
  Iterator get iterator => messages.iterator;

  @override
  String join([String separator = ""]) {
    return messages.join(separator);
  }

  @override
  get last => messages.last;

  @override
  lastWhere(bool Function(dynamic element) test, {Function()? orElse}) {
    if(orElse == null)return messages.lastWhere(test);
    return messages.lastWhere(test, orElse: ()=>orElse());
  }

  @override
  int get length => messages.length;

  @override
  Iterable<T> map<T>(T Function(dynamic e) toElement) {
    return messages.map(toElement);
  }

  @override
  bool moveNext() {
    if(_currentIndex == messages.length-1)return false;
    _currentIndex++;
    return true;
  }

  @override
  reduce(Function(dynamic value, dynamic element) combine) {
    return messages.cast().reduce(combine);
  }

  @override
  get single => messages.single;

  @override
  singleWhere(bool Function(dynamic element) test, {Function()? orElse}) {
    if(orElse != null)return messages.singleWhere(test, orElse: ()=>orElse());
    return messages.singleWhere(test);
  }

  @override
  Iterable skip(int count) {
    return messages.skip(count);
  }

  @override
  Iterable skipWhile(bool Function(dynamic value) test) {
    return messages.skipWhile(test);
  }

  @override
  Iterable take(int count) {
    return messages.take(count);
  }

  @override
  Iterable takeWhile(bool Function(dynamic value) test) {
    return messages.takeWhile(test);
  }

  @override
  List toList({bool growable = true}) {
    return messages.toList();
  }

  @override
  Set toSet() {
    return messages.toSet();
  }

  @override
  Iterable where(bool Function(dynamic element) test) {
    return messages.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return messages.whereType<T>();
  }
}
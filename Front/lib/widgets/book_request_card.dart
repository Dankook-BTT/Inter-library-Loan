import 'package:flutter/material.dart';
import '../models/book_request.dart';
import '../services/api_service.dart';
import 'efficiency_indicator.dart';

class BookRequestCard extends StatefulWidget {
  final BookRequest bookRequest;
  final VoidCallback onStatusChanged;

  BookRequestCard({required this.bookRequest, required this.onStatusChanged});

  @override
  _BookRequestCardState createState() => _BookRequestCardState();
}

class _BookRequestCardState extends State<BookRequestCard> {
  final ApiService apiService = ApiService(); // ApiService 인스턴스 생성
  String _currentStatus = '';

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.bookRequest.status;
  }

  void _updateStatus(BuildContext context, String status) async {
    try {
      await apiService.updateBookRequestStatus(widget.bookRequest.id, status); // widget.bookRequest로 변경
      setState(() {
        _currentStatus = status;
      });
      widget.onStatusChanged();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update status')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bookRequest.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('지은이: ${widget.bookRequest.author}'),
                Text('옮긴이: ${widget.bookRequest.translator}'),
                Text('도서 번호: ${widget.bookRequest.bookNumber}'),
                Text('Library: ${widget.bookRequest.library}'),
                EfficiencyIndicator(efficiency: widget.bookRequest.efficiency),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildActionButtons(context),
                ),
                if (_currentStatus == 'rejected')
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '거부됨',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('지난 요청', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  List<Widget> _buildActionButtons(BuildContext context) {
    return [
      ElevatedButton(
        onPressed: _currentStatus == 'rejected' ? null : () => _updateStatus(context, 'approved'),
        child: Text('승인'),
        style: ElevatedButton.styleFrom(
          foregroundColor: _currentStatus == 'rejected' ? Colors.grey : Colors.blue,
        ),
      ),
      SizedBox(width: 8),
      ElevatedButton(
        onPressed: _currentStatus == 'approved' ? null : () => _updateStatus(context, 'rejected'),
        child: Text('거절'),
        style: ElevatedButton.styleFrom(
          foregroundColor: _currentStatus == 'approved' ? Colors.grey : Colors.red,
        ),
      ),
    ];
  }
}

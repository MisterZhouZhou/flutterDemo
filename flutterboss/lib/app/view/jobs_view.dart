import 'package:flutter/material.dart';
import 'package:flutterboss/app/item/joblist_item.dart';
import 'package:flutterboss/app/model/job.dart';

class JobsTab extends StatefulWidget {
  @override
  JobList createState() => new JobList();
}

class JobList extends State<JobsTab> {

  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();
    getJobList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('Android',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: new FutureBuilder(
          future:  DefaultAssetBundle.of(context).loadString("assets/json/job.json"),
          builder: (context, snapshot){
            if(snapshot.hasData){
              _jobs = Job.fromJson(snapshot.data.toString());
              return new ListView.builder(
                  itemCount: _jobs.length,
                  itemBuilder: (BuildContext context, int index)=>buildJobItem(context, index));
            }else{
              return new Text('');
            }
          }
          )
    );
  }

  buildJobItem(BuildContext context, int index) {
    Job job = _jobs[index];

    var jobItem = new InkWell(
        onTap: () {
          showDialog(context: context, child: new AlertDialog(
              content: new Text(
                "尽情期待!",
                style: new TextStyle(fontSize: 20.0),
              )));
        },
        child: new JobListItem(job)
    );

    return jobItem;
  }

  void getJobList() {
    setState(() {
      _jobs = [
        new Job(name: "架构师（Android）", cname: "蚂蚁金服", size: "B轮", salary: "25k-45k", username: "Claire", title: "HR")
      ];

    });
  }

}
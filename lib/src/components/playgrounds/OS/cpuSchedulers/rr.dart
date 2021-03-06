import 'dart:collection';

import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Process.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/Scheduler.dart';
import 'package:static_aligator_ir/src/components/playgrounds/OS/models/TimeWindow.dart';

class RoundRobin implements CpuScheduler {

  final int quantum;

  RoundRobin(this.quantum);

  @override
  List<TimeWindow> calculate(List<Process> processes) {
    var time = 0;
    var doneProcesses = 0;
    var waitingQueue = Queue.of(processes);
    var readyQueue = Queue<Process>();
    var timeWindows = <TimeWindow>[];

    void addReadyProccess(){
      var ready = waitingQueue.where((p) => p.arrivalTime <= time);
      ready.forEach(readyQueue.add);
      waitingQueue.removeWhere((p) => p.arrivalTime <= time);
    }

    addReadyProccess();

    // for each time increment
    while (doneProcesses != processes.length) {
      if (readyQueue.isNotEmpty) {
        var process = readyQueue.removeFirst();
        process.start(time);
        for(var i=0;i<quantum && process.remainingTime!=0;i++){
          time++;
          process.advance(1);
          addReadyProccess();
        }
        var frame = process.stop(time);
        timeWindows.add(frame);
        if(process.remainingTime==0){
          doneProcesses++;
        } else {
          readyQueue.add(process);
        }
      } else {
        time++;
        addReadyProccess();
      }
    }
    return timeWindows;
  }

}
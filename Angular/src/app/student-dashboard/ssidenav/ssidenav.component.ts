import { Component, OnInit } from '@angular/core';
import { DataSource } from '@angular/cdk/collections';
import { Observable } from 'rxjs';
import { TreeControl } from '@angular/cdk/tree';

@Component({
  selector: 'app-ssidenav',
  templateUrl: './ssidenav.component.html',
  styleUrls: ['./ssidenav.component.scss']
})
export class SsidenavComponent implements OnInit {
  dataSource: any[] | DataSource<any> | Observable<any[]> = [];
  treeControl!: TreeControl<any, any>;
  hasChild!: (index: number, nodeData: any) => boolean;

  constructor() { }

  ngOnInit(): void {
  }

}


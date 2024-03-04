package kr.co.ch02.sub2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
//컴포넌트 이름을 설정하지 않을시 클래스 명으로 computer
@Component("com")
public class Computer {

    // 필드 주입
    @Autowired
    private Cpu cpu;

    // 생성자 주입
    private Ram ram;

    @Autowired
    public Computer(Ram ram){
        this.ram = ram;
    }

    // 세터 주입
    private Hdd hdd;

    @Autowired
    public void setHdd(Hdd hdd) {
        this.hdd = hdd;
    }

    public void show(){
        cpu.show();
        ram.show();
        hdd.show();
    }

}
